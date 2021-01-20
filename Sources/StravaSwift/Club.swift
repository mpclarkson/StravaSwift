// Club.swift
// Copyright (c) 2021 Copilot

import Foundation
import SwiftyJSON

/**
 Clubs represent groups of athletes on Strava. They can be public or private. The object is returned in summary or detailed representations.
 **/
public struct Club: Strava, Codable, Equatable, Hashable {
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

    /**
     Initializer

     - Parameter json: SwiftyJSON object
     - Internal
     **/
    public init(_ json: JSON) {
        id = json["id"].int
        name = json["name"].string
        description = json["description"].string
        resourceState = json["resource_state"].strava(ResourceState.self)
        city = json["city"].string
        state = json["state"].string
        country = json["country"].string
        clubType = json["club_type"].strava(ClubType.self)
        sportType = json["sport_type"].strava(SportType.self)
        profileMedium = URL(optionalString: json["profile_medium"].string)
        profile = URL(optionalString: json["profile"].string)
        isPrivate = json["private"].bool
        memberCount = json["member_count"].int
    }
}
