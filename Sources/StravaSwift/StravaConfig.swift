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
    /** Default: Read public segments, public routes, public profile data, public posts, public events, club feeds, and leaderboards **/
    case read = "read"
    /** Read private routes, private segments, and private events for the user **/
    case readAll = "read_all"
    /** Read all profile information even if the user has set their profile visibility to Followers or Only You **/
    case profileReadAll = "profile:read_all"
    /** Update the user's weight and Functional Threshold Power (FTP), and access to star or unstar segments on their behalf **/
    case profileWrite = "profile:write"
    /** Read the user's activity data for activities that are visible to Everyone and Followers, excluding privacy zone data **/
    case activityRead = "activity:read"
    /** The same access as activity:read, plus privacy zone data and access to read the user's activities with visibility set to Only You **/
    case activityReadAll = "activity:read_all"
    /** Access to create manual activities and uploads, and access to edit any activities that are visible to the app, based on activity read access level **/
    case activityWrite = "activity:write"
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
    public let scopes: [Scope]
    /** The delegate responsible for storing and retrieving the OAuth token in your app **/
    public let delegate: TokenDelegate

    public let forcePrompt: Bool

    /**
     Initializer

     - Parameters:
        - clientId: Int
        - clientSecret: Int
        - redirectUri: String
        - scope: Scope enum - default is .read)
        - delegate: TokenDelegateProtocol - default is the DefaultTokenDelegate
     **/
    public init(clientId: Int,
                clientSecret: String,
                redirectUri: String,
                scopes: [Scope] = [.read],
                delegate: TokenDelegate? = nil,
                forcePrompt: Bool = true) {
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.redirectUri = redirectUri
        self.scopes = scopes
        self.delegate = delegate ?? DefaultTokenDelegate()
        self.forcePrompt = forcePrompt
    }
}
