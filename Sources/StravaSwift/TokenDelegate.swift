// TokenDelegate.swift
// Copyright (c) 2021 Copilot

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
