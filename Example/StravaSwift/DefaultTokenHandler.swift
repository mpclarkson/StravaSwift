//
//  TokenHandler.swift
//  StravaSwift
//
//  Created by MATTHEW CLARKSON on 23/05/2016.
//  Copyright © 2016 Matthew Clarkson. All rights reserved.
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