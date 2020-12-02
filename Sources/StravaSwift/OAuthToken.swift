//
//  OAuthToken.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation

/**
OAuthToken which is required for requesting Strava resources
 **/
public struct OAuthToken: Decodable {

    /** The access token **/
    public let accessToken: String?

    /** The refresh token **/
    public let refreshToken: String?

    /** Expiry for the token in seconds since the epoch **/
    public let expiresAt : Int?

    /** The athlete **/
    public let athlete: Athlete?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case expiresAt = "expires_at"
        case athlete
    }

    public init(access: String?, refresh: String?, expiry: Int?) {
        self.accessToken = access
        self.refreshToken = refresh
        self.expiresAt = expiry
        self.athlete = nil
    }
}

extension OAuthToken: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(accessToken, forKey: .accessToken)
        try container.encode(refreshToken, forKey: .refreshToken)
        try container.encode(expiresAt, forKey: .expiresAt)
    }
}
