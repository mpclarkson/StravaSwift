//
//  DefaultTokenHandler.swift
//  Pods
//
//  Created by MATTHEW CLARKSON on 24/05/2016.
//
//

/**
 The default delegate for accessing and storing tokens. You should implement your own handler.
 **/
public struct DefaultTokenHandler: TokenDelegate {
    private var token: OAuthToken?
    
    /**
     Returns a token if it is available
     **/
    public func get() -> OAuthToken? {
        return token
    }
    
    /**
     Stores the token
     **/
    public mutating func set(token: OAuthToken?) {
        self.token = token
    }
}