//
//  StravaClient.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SafariServices

/**
 StravaClient responsible for making all api requests
*/
open class StravaClient {
    
    /**
     Access the shared instance
     */
    open static let sharedInstance = StravaClient()
    
    fileprivate init() {}
    fileprivate var config: StravaConfig?
    
    /** 
      The OAuthToken returned by the delegate
     **/
    open var token:  OAuthToken? { return config?.delegate.get() }
    
    internal var authParams: [String: Any] {
        return [
            "client_id" : config?.clientId ?? 0,
            "redirect_uri" : config?.redirectUri ?? "",
            "scope" : config?.scope.rawValue ?? "",
            "state" : "ios" as AnyObject,
            "approval_prompt" : "force",
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
    
    internal var safariViewController: SFSafariViewController?
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

extension StravaClient {
    
    var currentViewController : UIViewController? { return UIApplication.shared.keyWindow?.rootViewController }
    
    /**
     Opens the Strava OAuth web page in mobile Safari for the user to authorize the application.
     **/
    public func authorize(sender: UIViewController? = nil) {
        
        UIApplication.shared.openURL(Router.authorizationUrl)

//        safariViewController = SFSafariViewController(url: Router.authorizationUrl)
//        if let safariViewController = safariViewController {
//            (sender ?? currentViewController)?.present(safariViewController, animated: true, completion: nil)
//        }
    }
    
    /**
    Helper method to get the code from the redirection from Strava after the user has authorized the application (useful in AppDelegate)
     
     - Parameter: url
     - Returns: the OAuth code
     **/
    public func handleAuthorizationRedirect(_ url: URL) -> String?  {
        safariViewController?.dismiss(animated: true, completion: nil)
        safariViewController = nil
        return url.getQueryParameters()?["code"]
    }
    
    /**
     Get an OAuth token from Strava
     
     - Parameter code: the code (string) returned from strava
     - Parameter result: a closure to handle the OAuthToken
     **/
    public func getAccessToken(_ code: String, result: @escaping (((OAuthToken)?) -> Void)) throws {
        try oauthRequest(Router.token(code: code))?.responseStrava { [weak self] (response: DataResponse<OAuthToken>) in
            guard let `self` = self else { return }
            let token = response.result.value
            self.config?.delegate.set(token)
            result(token)
        }
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
                result(response.result.value)
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
    public func request<T: Strava>(_ route: Router, result: @escaping (((T)?) -> Void), failure: @escaping (NSError) -> Void) throws {
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
    public func request<T: Strava>(_ route: Router, result: @escaping ((([T])?) -> Void), failure: @escaping (NSError) -> Void) throws {
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
    
    fileprivate func isConfigured() -> (Bool, StravaClientError?) {
        if config == nil {
            return (false, StravaClientError.invalidCredentials)
        }
        
        return (true, nil)
    }
    
    fileprivate func checkConfiguration() {
        let (_, error) = StravaClient.sharedInstance.isConfigured()
        
        if let _ = error {
            fatalError("Strava client is not configured")
        }
    }
    
    fileprivate func oauthRequest(_ urlRequest: URLRequestConvertible) throws -> DataRequest? {
        checkConfiguration()
        
        return try Alamofire.request(urlRequest)
    }
    
    fileprivate func oauthUpload<T: Strava>(URLRequest: URLRequestConvertible, upload: UploadData, completion: @escaping (DataResponse<T>) -> ()) {
        checkConfiguration()
        
        guard let url = try? URLRequest.asURLRequest() else { return }
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(upload.file, withName: "\(upload.name ?? "default").\(upload.dataType)")
            for (key, value) in upload.params {
                if let v = value {
                    multipartFormData.append(v.data(using: String.Encoding.utf8.rawValue)!, withName: key)
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
