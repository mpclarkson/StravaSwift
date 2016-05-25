//
//  Client.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

/**
  OAuth scope
 */
public enum Scope: String {
    /** Default, private activities are not returned, privacy zones are respected in stream requests **/
    case Public = "public"
    /** Modify activities, upload on the user’s behalf **/
    case Write = "write"
    /** View private activities and data within privacy zones **/
    case ViewPrivate = "view_private"
    /** Both .ViewPrivate and .Write access  **/
    case ViewPrivateWrite = "view_private,write"
}

/**
  Strava configuration struct which should be passed to the StravaClient.sharedInstance.initWithConfig(_:) method
 **/
public struct StravaConfig {
    
    /** The application's Id **/
    public let clientId: Int
    /** The application's Secrent **/
    public let clientSecret: String
    /** The application's RedirectURL - this should be registered in the info.plist **/
    public let redirectUri: String
    /** The requested permission scope **/
    public let scope: Scope
    /** The delegate responsible for storing and retrieving the OAuth token in your app **/
    public let delegate: TokenDelegate
    
    /**
     Initializer
     
     - Parameters:
        - clientId: Int
        - clientSecret: Int
        - redirectUri: String
        - scope: Scope enum - default is .ViewPrivateWrite)
        - delegate: TokenDelegateProtocol - default is the DefaultTokenDelegate
     **/
    public init(clientId: Int,
                clientSecret: String,
                redirectUri: String,
                scope: Scope = .ViewPrivateWrite,
                delegate: TokenDelegate? = nil ) {
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.redirectUri = redirectUri
        self.scope = scope
        self.delegate = delegate ?? DefaultTokenDelegate()
    }
}
