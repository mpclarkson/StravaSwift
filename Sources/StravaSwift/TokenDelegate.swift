//
//  TokenDelegate.swift
//  StravaSwift
//
//  Created by MATTHEW CLARKSON on 23/05/2016.
//  Copyright © 2016 Matthew Clarkson. All rights reserved.
//

/**
 Token Delegate protocol - responsible for storing and retrieving the OAuth token
 **/
public protocol TokenDelegate {

    /**
     Retrieves the token

     - Returns: an optional OAuthToken
     **/
    func get() -> OAuthToken?

    /**
     Store the token

     - Parameter token: an optional OAuthToken
     **/
    func set(_ token: OAuthToken?)
}
