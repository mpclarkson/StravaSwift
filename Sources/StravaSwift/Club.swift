//
//  Club.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation

/**
 Clubs represent groups of athletes on Strava. They can be public or private. The object is returned in summary or detailed representations.
 **/
public struct Club: Decodable {
    public let id: Int?
    public let profileMedium: URL?
    public let profile: URL?
    public let name: String?
    public let description: String?
    public let city: String?
    public let state: String?
    public let country: String?
    public let clubType: ClubType?
    public let sportType: SportType?
    public let isPrivate: Bool?
    public let memberCount: Int?
    public let resourceState: ResourceState?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case resourceState = "resource_state"
        case city
        case state
        case country
        case clubType = "club_type"
        case sportType = "sport_type"
        case profileMedium = "profile_medium"
        case profile
        case isPrivate = "private"
        case memberCount = "member_count"
    }
}
