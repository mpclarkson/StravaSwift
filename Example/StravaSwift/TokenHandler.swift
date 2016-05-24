//
//  TokenHandler.swift
//  StravaSwift
//
//  Created by MATTHEW CLARKSON on 23/05/2016.
//  Copyright © 2016 Matthew Clarkson. All rights reserved.
//

import StravaSwift

struct TokenHandler: TokenDelegate {
    private var token: OAuthToken?
    
    func get() -> OAuthToken? {
        return token
    }
    
    mutating func set(token: OAuthToken?) {
         self.token = token
    }
}