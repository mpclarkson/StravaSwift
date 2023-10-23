//
//  StravaClient.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import AuthenticationServices
import Foundation
import Alamofire
import SwiftyJSON
import SafariServices

/**
 StravaClient responsible for making all api requests
*/
open class StravaClient: NSObject {

    /**
     Access the shared instance
     */
    public static let sharedInstance = StravaClient()

    fileprivate override init() {}
    fileprivate var config: StravaConfig?

    public typealias AuthorizationHandler = (Swift.Result<OAuthToken, Error>) -> ()
    fileprivate var currentAuthorizationHandler: AuthorizationHandler?
    fileprivate var authSession: NSObject?  // Holds a reference to ASWebAuthenticationSession / SFAuthenticationSession depending on iOS version

    /**
      The OAuthToken returned by the delegate
     **/
    open var token:  OAuthToken? { return config?.delegate.get() }

    internal var authParams: [String: Any] {
        return [
            "client_id" : config?.clientId ?? 0,
            "redirect_uri" : config?.redirectUri ?? "",
            "scope" : (config?.scopes ?? []).map { $0.rawValue }.joined(separator: ","),
            "state" : "ios" as AnyObject,
            "approval_prompt" : config?.forcePrompt ?? true ? "force" : "auto",
            "response_type" : "code"
        ]
    }

    internal func tokenParams(_ code: String) -> [String: Any]  {
        return [
            "client_id" : config?.clientId ?? 0,
            "client_secret" : config?.clientSecret ?? "",
            "code" : code
        ]
    }

    internal func refreshParams(_ refreshToken: String) -> [String: Any]  {
        return [
            "client_id" : config?.clientId ?? 0,
            "client_secret" : config?.clientSecret ?? "",
            "grant_type" : "refresh_token",
            "refresh_token" : refreshToken
        ]
    }
}

//MARK:varConfig

extension StravaClient {

    /**
     Initialize the shared instance with your credentials. You must use this otherwise fatal errors will be
     returned when making api requests.

     - Parameter config: a StravaConfig struct
     - Returns: An instance of self (i.e. StravaClient)
     */
    public func initWithConfig(_ config: StravaConfig) -> StravaClient {
        self.config = config

        return self
    }
}

//MARK : - Auth

extension StravaClient: ASWebAuthenticationPresentationContextProviding {

    var currentWindow: UIWindow? { return UIApplication.shared.keyWindow }
    var currentViewController: UIViewController? { return currentWindow?.rootViewController }

    /**
     Starts the Strava OAuth authorization. The authentication will use the Strava app be default if it is installed on the device. If the user does not have Strava installed, it will fallback on `SFAuthenticationSession` or `ASWebAuthenticationSession` depending on the iOS version used at runtime.
     */
    public func authorize(result: @escaping AuthorizationHandler) {
        let appAuthorizationUrl = Router.appAuthorizationUrl
        if UIApplication.shared.canOpenURL(appAuthorizationUrl) {
            currentAuthorizationHandler = result    // Stores the handler to be executed once `handleAuthorizationRedirect(url:)` is called
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appAuthorizationUrl, options: [:])
            } else {
                UIApplication.shared.openURL(appAuthorizationUrl)
            }
        } else {
            if #available(iOS 12.0, *) {
                let webAuthenticationSession = ASWebAuthenticationSession(url: Router.webAuthorizationUrl,
                                                                          callbackURLScheme: config?.redirectUri.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
                                                                          completionHandler: { (url, error) in
                    if let url = url, error == nil {
                        self.handleAuthorizationRedirect(url, result: result)
                    } else {
                        result(.failure(error!))
                    }
                })
                authSession = webAuthenticationSession
                if #available(iOS 13.0, *) {
                    webAuthenticationSession.presentationContextProvider = self
                }
                webAuthenticationSession.start()
            } else {
                currentAuthorizationHandler = result    // Stores the handler to be executed once `handleAuthorizationRedirect(url:)` is called
                UIApplication.shared.open(Router.webAuthorizationUrl, options: [:])
            }
        }
    }

    /**
    Helper method to get the code from the redirection from Strava after the user has authorized the application (useful in AppDelegate)

     - Parameter url the url returned by Strava through the (ASWeb/SF)AuthenricationSession or application open options.
     - Returns: a boolean that indicates if this url is for Strava, has a code and can be handled properly
     **/
    public func handleAuthorizationRedirect(_ url: URL) -> Bool {
        if let redirectUri = config?.redirectUri, url.absoluteString.starts(with: redirectUri),
           let params = url.getQueryParameters(), params["code"] != nil, params["scope"] != nil, params["state"] == "ios" {

            self.handleAuthorizationRedirect(url) { result in
                if let currentAuthorizationHandler = self.currentAuthorizationHandler {
                    currentAuthorizationHandler(result)
                    self.currentAuthorizationHandler = nil
                }
            }
            return true
        } else {
            return false
        }
    }

    /**
    Helper method to get the code from the redirection from Strava after the user has authorized the application (useful in AppDelegate)

     - Parameter url the url returned by Strava through the (ASWeb/SF)AuthenricationSession or application open options.
     - Parameter result a closure to handle the OAuthToken
     **/
    private func handleAuthorizationRedirect(_ url: URL, result: @escaping AuthorizationHandler) {
        if let code = url.getQueryParameters()?["code"] {
            self.getAccessToken(code, result: result)
        } else {
            result(.failure(generateError(failureReason: "Invalid authorization code", response: nil)))
        }
    }

    /**
     Get an OAuth token from Strava

     - Parameter code: the code (string) returned from strava
     - Parameter result: a closure to handle the OAuthToken
     **/
    private func getAccessToken(_ code: String, result: @escaping AuthorizationHandler) {
        do {
            try oauthRequest(Router.token(code: code))?.responseStrava { [weak self] (response: DataResponse<OAuthToken>) in
                guard let self = self else { return }
                let token = response.result.value!
                self.config?.delegate.set(token)
                result(.success(token))
            }
        } catch let error as NSError {
            result(.failure(error))
        }
    }

    /**
     Refresh an OAuth token from Strava

     - Parameter refresh: the refresh token from Strava
     - Parameter result: a closure to handle the OAuthToken
     **/
    public func refreshAccessToken(_ refreshToken: String, result: @escaping AuthorizationHandler) {
        do {
            try oauthRequest(Router.refresh(refreshToken: refreshToken))?.responseStrava { [weak self] (response: DataResponse<OAuthToken>) in
                guard let self = self else { return }
                if let token = response.result.value {
                    self.config?.delegate.set(token)
                    result(.success(token))
                } else {
                    result(.failure(self.generateError(failureReason: "No valid token", response: nil)))
                }
            }
        } catch let error as NSError {
            result(.failure(error))
        }
    }

    // ASWebAuthenticationPresentationContextProviding

    @available(iOS 12.0, *)
    public func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return currentWindow ?? ASPresentationAnchor()
    }
}


//MARK: - Athlete

extension StravaClient {

    public func upload<T: Strava>(_ route: Router, upload: UploadData, result: @escaping (((T)?) -> Void), failure: @escaping (NSError) -> Void) {
        do {
            try oauthUpload(URLRequest: route.asURLRequest(), upload: upload) { (response: DataResponse<T>) in
                if let statusCode = response.response?.statusCode, (400..<500).contains(statusCode) {
                    failure(self.generateError(failureReason: "Strava API Error", response: response.response))
                } else {
                    result(response.result.value)
                }
            }
        } catch let error as NSError {
            failure(error)
        }
    }

    /**
     Request a single object from the Strava Api

     - Parameter route: a Router enum case which may require parameters
     - Parameter result: a closure to handle the returned object
     **/
    public func request<T: Strava>(_ route: Router, result: @escaping (((T)?) -> Void), failure: @escaping (NSError) -> Void) {
        do {
            try oauthRequest(route)?.responseStrava { (response: DataResponse<T>) in
                // HTTP Status codes above 400 are errors
                if let statusCode = response.response?.statusCode, (400..<500).contains(statusCode) {
                    failure(self.generateError(failureReason: "Strava API Error", response: response.response))
                } else {
                    result(response.result.value)
                }
            }
        } catch let error as NSError {
            failure(error)
        }
    }

    /**
     Request an array of objects from the Strava Api

     - Parameter route: a Router enum case which may require parameters
     - Parameter result: a closure to handle the returned objects
     **/
    public func request<T: Strava>(_ route: Router, result: @escaping ((([T])?) -> Void), failure: @escaping (NSError) -> Void) {
        do {
            try oauthRequest(route)?.responseStravaArray { (response: DataResponse<[T]>) in
                // HTTP Status codes above 400 are errors
                if let statusCode = response.response?.statusCode, (400..<500).contains(statusCode) {
                    failure(self.generateError(failureReason: "Strava API Error", response: response.response))
                } else {
                    result(response.result.value)
                }
            }
        } catch let error as NSError {
            failure(error)
        }
    }

    fileprivate func generateError(failureReason: String, response: HTTPURLResponse?) -> NSError {
        let errorDomain = "com.stravaswift.error"
        let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
        let code = response?.statusCode ?? 0
        let returnError = NSError(domain: errorDomain, code: code, userInfo: userInfo)

        return returnError
    }

}

extension StravaClient {

    fileprivate func isConfigured() -> (Bool) {
        return config != nil
    }

    fileprivate func checkConfiguration() {
        if !isConfigured() {
            fatalError("Strava client is not configured")
        }
    }

    fileprivate func oauthRequest(_ urlRequest: URLRequestConvertible) throws -> DataRequest? {
        checkConfiguration()

        return Alamofire.request(urlRequest)
    }

    fileprivate func oauthUpload<T: Strava>(URLRequest: URLRequestConvertible, upload: UploadData, completion: @escaping (DataResponse<T>) -> ()) {
        checkConfiguration()

        guard let url = try? URLRequest.asURLRequest() else { return }

        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(upload.file, withName: "file", fileName: "\(upload.name ?? "default").\(upload.dataType)", mimeType: "octet/stream")
            for (key, value) in upload.params {
                if let value = value as? String {
                    multipartFormData.append(value.data(using: .utf8)!, withName: key)
                }
            }
        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, with: url) { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseStrava { (response: DataResponse<T>) in
                    completion(response)
                }
            case .failure(let encodingError):
                print(encodingError)
            }
        }
    }
}
