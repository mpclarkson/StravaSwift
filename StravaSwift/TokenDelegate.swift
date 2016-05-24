//
//  TokenDelegate.swift
//  StravaSwift
//
//  Created by MATTHEW CLARKSON on 23/05/2016.
//  Copyright © 2016 Matthew Clarkson. All rights reserved.
//

public protocol TokenDelegate {
    func get() -> OAuthToken?
    mutating func set(token: OAuthToken?)
}
