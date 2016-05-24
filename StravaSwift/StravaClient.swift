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


/** StravaClient Class
*/
public class StravaClient {
    
    public static let sharedInstance = StravaClient()
    
    private init() {}
    
    private var clientId: Int?
    private var clientSecret: String?
    private var redirectUri: String?
    private var scope: Scope?
    private var delegage: TokenDelegate?
    
    public var token:  OAuthToken? { return delegage?.get() }
    
    var authParams: [String:AnyObject] {
        return [
            "client_id" : clientId ?? 0,
            "redirect_uri" : redirectUri ?? "",
            "scope" : scope?.rawValue ?? "",
            "state" : "ios",
            "approval_prompt" : "force",
            "response_type" : "code"
        ]
    }
    
    func tokenParams(code: String) -> [String:AnyObject]  {
        return [
            "client_id" : clientId ?? 0,
            "client_secret" : clientSecret ?? "",
            "code" : code
        ]
    }
}

//MARK: - Config

extension StravaClient {

    public func initWithConfig(config: StravaConfig) -> StravaClient {
        clientId = config.clientId
        clientSecret = config.clientSecret
        redirectUri = config.redirectUri
        scope = config.scope
        delegage = config.delegate
        
        return self
    }
    
    private func isConfigured() -> (Bool, StravaClientError?) {
        if redirectUri == nil || clientSecret == nil || clientId == nil  {
            return (false, StravaClientError.NoCredentials)
        }
        
        return (true, nil)
    }
    
    public func oauthRequest(URLRequest: URLRequestConvertible) -> Request? {
        let (_, error) = StravaClient.sharedInstance.isConfigured()
        
        if let _ = error {
             fatalError("Strava client is not configured")
        }
        
        return Alamofire.Manager.sharedInstance.request(URLRequest.URLRequest)
    }
}

//MARK : - Auth

extension StravaClient {
   
    public func authorize() {
        UIApplication.sharedApplication().openURL(Router.authorizationUrl)
    }
    
    public func handleAuthorizationRedirect(url: NSURL) -> String?  {
        return url.getQueryParameters()?["code"]
    }
    
    public func getAccessToken(code: String, result: ((OAuthToken)? -> Void)) {
        oauthRequest(Router.Token(code))?.responseStrava { [weak self] (response: Response<OAuthToken, NSError>) in
            guard let `self` = self else { return }
            let token = response.result.value
            self.delegage?.set(token)
            result(token)
        }
    }
}


//MARK: - Athlete

extension StravaClient {

    public func request<T: Strava>(route: Router, result: ((T)? -> Void)) {
        oauthRequest(route)?.responseStrava { (response: Response<T, NSError>) in
            result(response.result.value)
        }
    }
    
    public func request<T: Strava>(route: Router, result: (([T])? -> Void)) {
        oauthRequest(route)?.responseStravaArray { (response: Response<[T], NSError>) in
            result(response.result.value)
        }
    }
}