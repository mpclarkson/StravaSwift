// DefaultTokenDelegate.swift
// Copyright (c) 2021 Copilot

import Foundation

/**
  The default token delegate. You should replace this with something that persists the token (e.g. to NSUserDefaults)
 **/
open class DefaultTokenDelegate: TokenDelegate {
    fileprivate var token: OAuthToken?

    /**
     Retrieves the token

     - Returns: a optional OAuthToken
     **/
    open func get() -> OAuthToken? {
        token
    }

    /**
     Stores the token internally (note that it is not persisted between app start ups)

     - Parameter token: an optional OAuthToken
     **/
    open func set(_ token: OAuthToken?) {
        self.token = token
    }
}
