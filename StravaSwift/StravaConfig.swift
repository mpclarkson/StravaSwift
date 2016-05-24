//
//  Client.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation

public enum Scope: String {
    case Public = "public"
    case Write = "write"
    case ViewPrivate = "view_private"
    case ViewPrivateWrite = "view_private,write"
    
}

/** Client Class
 */
public struct StravaConfig {
    
    public var clientId: Int
    public var clientSecret: String
    public var redirectUri: String
    public var scope: Scope
    public var delegate: TokenDelegate
    
    public init(clientId: Int, clientSecret: String, redirectUri: String, scope: Scope = .ViewPrivateWrite, delegate: TokenDelegate) {
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.redirectUri = redirectUri
        self.scope = scope
        self.delegate = delegate
    }
}
