//
//  DefaultTokenDelegate.swift
//  Pods
//
//  Created by MATTHEW CLARKSON on 24/05/2016.
//
//

import Foundation

/**
 The default token delegate. You really should replace this with something that persists the 
 token (eg to NSUserDefaults)
**/
public struct DefaultTokenDelegate: TokenDelegate {
    private var token: OAuthToken?
    
    public func get() -> OAuthToken? {
        return token
    }
    
    public mutating func set(token: OAuthToken?) {
        self.token = token
    }
}