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
    
    internal func tokenParams(_ code: String) -> [String:AnyObject]  {
        return [
            "client_id" : config?.clientId as AnyObject? ?? 0 as AnyObject,
            "client_secret" : config?.clientSecret as AnyObject? ?? "" as AnyObject,
            "code" : code as AnyObject
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

extension StravaClient {
    
    /**
     Opens the Strava OAuth web page in mobile Safari for the user to authorize the application.
     **/
    public func authorize() {
        UIApplication.shared.openURL(Router.authorizationUrl)
    }
    
    /**
    Helper method to get the code from the redirection from Strava after the user has authorized the application (useful in AppDelegate)
     
     - Parameter: url
     - Returns: the OAuth code
     **/
    public func handleAuthorizationRedirect(_ url: URL) -> String?  {
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

    /**
     Request a single object from the Strava Api
     
     - Parameter route: a Router enum case which may require parameters
     - Parameter result: a closure to handle the returned object
     **/
    public func request<T: Strava>(_ route: Router, result: @escaping (((T)?) -> Void)) throws {
        switch route {
//        case .Upload(let upload):
//            oauthUpload(route.URLRequest, upload: upload)?.responseStrava { (response: Response<T, NSError>) in
//                result(response.result.value)
//            }
        default:
            try oauthRequest(route)?.responseStrava { (response: DataResponse<T>) in
                result(response.result.value)
            }
        }
   }
    
    /**
     Request an array of objects from the Strava Api
     
     - Parameter route: a Router enum case which may require parameters
     - Parameter result: a closure to handle the returned objects
     **/
    public func request<T: Strava>(_ route: Router, result: @escaping ((([T])?) -> Void)) throws {
        try oauthRequest(route)?.responseStravaArray { (response: DataResponse<[T]>) in
            result(response.result.value)
        }
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
//
//    private func oauthUpload(URLRequest: URLRequestConvertible, upload: Upload) -> Request? {
//        checkConfiguration()
//        
//                guard let url = URLRequest.URLRequest.URL else { return nil }
//        
//                return Alamofire.Manager.sharedInstance.upload(.POST, url,
//                    headers: URLRequest.URLRequest.allHTTPHeaderFields,
//                    multipartFormData: { multipartFormData in
//        
//                        multipartFormData.appendBodyPart(data: upload.file, name: "file.gpx")
//                        for (key, value) in upload.params {
//                            multipartFormData.appendBodyPart(data: value.dataUsingEncoding(NSUTF8StringEncoding)!, name: key)
//                        }
//                    },
//                    encodingMemoryThreshold: Manager.MultipartFormDataEncodingMemoryThreshold,
//                    encodingCompletion: { encodingResult in
//                        switch encodingResult {
//                        case .Success(let upload, _, _):
//                            upload.responseJSON { response in
//                                debugPrint(response)
//                            }
//                        case .Failure(let encodingError):
//                            print(encodingError)
//                        }
//                })
//    }

}
