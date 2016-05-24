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
    
    public let clientId: Int
    public let clientSecret: String
    public let redirectUri: String
    public let scope: Scope
    public let delegate: TokenDelegate
    
    public init(clientId: Int, clientSecret: String, redirectUri: String, scope: Scope = .ViewPrivateWrite, delegate: TokenDelegate = DefaultTokenHandler()) {
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.redirectUri = redirectUri
        self.scope = scope
        self.delegate = delegate
    }
}
