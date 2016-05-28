//
//  Event.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 Group Events are optionally recurring events for club members. Only club members can access private club events. The objects are returned in summary representation.
 **/
public final class Event: Strava, StravaResourceState {
    public var id: Int?
    public var resourceState: ResourceState?
    public var title: String?
    public var descr: String?
    public var clubId: Int?
    public var organizingAthlete: Athlete?
    public var activityType: ActivityType?
    public var createdAt: NSDate?
    public var routeId: Int?
    public var womenOnly: Bool?
    public var `private`: Bool?
    public var skillLevels: SkillLevel?
    public var terrain: Terrain?
    public var upcomingOccurrences: [NSDate]?
    
    /**
     Initializer
     
     - Parameter json: SwiftyJSON object
     - Internal
     **/
    required public init(_ json: JSON) {
        setResourceState(json)
        id = json["id"].int
        title = json["title"].string
        descr = json["description"].string
        clubId = json["club_id"].int
        organizingAthlete = json["organizing_athlete"].strava(Athlete)
        activityType = json["activity_type"].strava(ActivityType)
        createdAt = json["created_at"].string?.toDate()
        routeId = json["route_id"].int
        womenOnly = json["women_only"].bool
        `private` =  json["private"].bool
        skillLevels = json["skill_level"].strava(SkillLevel)
        terrain = json["terrain"].strava(Terrain)
        upcomingOccurrences = json["terrain"].arrayValue.flatMap { $0.string?.toDate() }
    }
}
