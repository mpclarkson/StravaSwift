//
//  Event.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Event: Strava, StravaResourceState {
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
    
    required public init(_ json: JSON) {
        setResourceState(json)
        id = json["id"].int
        title = json["title"].string
        descr = json["description"].string
        clubId = json["club_id"].int
        organizingAthlete = Athlete(json["organizing_athlete"])
        activityType = ActivityType(optionalRawValue: json["activity_type"].string)
        createdAt = json["created_at"].string?.toDate()
        routeId = json["route_id"].int
        womenOnly = json["women_only"].bool
        `private` =  json["private"].bool
        skillLevels = SkillLevel(optionalRawValue: json["skill_level"].int)
        terrain = Terrain(optionalRawValue: json["terrain"].int)
        upcomingOccurrences = json["terrain"].arrayValue.flatMap { $0.string?.toDate() }
    }
}
