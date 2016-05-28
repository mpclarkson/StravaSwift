//
//  DefaultTokenDelegate.swift
//  Pods
//
//  Created by MATTHEW CLARKSON on 24/05/2016.
//
//

import Foundation

/**
 The default token delegate. You should replace this with something that persists the 
 token (e.g. to NSUserDefaults)
**/
public struct DefaultTokenDelegate: TokenDelegate {
    private var token: OAuthToken?
    
    /**
     Retrieves the token
     
     - Returns: a optional OAuthToken
     **/
    public func get() -> OAuthToken? {
        return token
    }
    
    /**
     Stores the token internally (note that it is not persisted between app start ups)
     
     - Parameter token: an optional OAuthToken
     **/
    public mutating func set(token: OAuthToken?) {
        self.token = token
    }
}