//
//  Event.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation

/**
 Group Events are optionally recurring events for club members. Only club members can access private club events. The objects are returned in summary representation.
 **/
public struct Event: Decodable {
    public let id: Int?
    public let resourceState: ResourceState?
    public let title: String?
    public let descr: String?
    public let clubId: Int?
    public let organizingAthlete: Athlete?
    public let activityType: ActivityType?
    public let createdAt: Date?
    public let routeId: Int?
    public let womenOnly: Bool?
    public let isPrivate: Bool?
    public let skillLevels: SkillLevel?
    public let terrain: Terrain?
    
    public var upcomingOccurrences: [Date] {
        return []
    }

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case resourceState = "resource_state"
        case descr = "description"
        case clubId = "club_id"
        case organizingAthlete = "organizing_athlete"
        case activityType = "activity_type"
        case createdAt = "created_at"
        case routeId = "route_id"
        case womenOnly = "women_only"
        case isPrivate = "private"
        case skillLevels = "skill_level"
        case terrain
    }
//    /**
//     Initializer
//
//     - Parameter json: SwiftyJSON object
//     - Internal
//     **/
//    required public init(_ json: JSON) {
//        resourceState = json["resource_state"].strava(ResourceState.self)
//        id = json["id"].int
//        title = json["title"].string
//        descr = json["description"].string
//        clubId = json["club_id"].int
//        organizingAthlete = json["organizing_athlete"].strava(Athlete.self)
//        activityType = json["activity_type"].strava(ActivityType.self)
//        createdAt = json["created_at"].string?.toDate()
//        routeId = json["route_id"].int
//        womenOnly = json["women_only"].bool
//        `private` =  json["private"].bool
//        skillLevels = json["skill_level"].strava(SkillLevel.self)
//        terrain = json["terrain"].strava(Terrain.self)
//        upcomingOccurrences = json["terrain"].arrayValue.compactMap { $0.string?.toDate() }
//    }
}
