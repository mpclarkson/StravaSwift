//
//  Segment.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
  Segments are specific sections of road. Athletes’ times are compared on these segments and leaderboards are created.
 **/
public class Segment: Strava, StravaResourceState {
    public var id: Int?
    public var name: String?
    public var descr: String?
    public var resourceState: ResourceState?
    public var activityType: ActivityType?
    public var distance: Double?
    public var averageGrade: Double?
    public var maximumGrade: Double?
    public var elevationHigh: Double?
    public var elevationLow: Double?
    public var startLatLng: Location?
    public var endLatLng: Location?
    public var climbCategory: Int?
    public var city: String?
    public var state: String?
    public var country: String?
    public var `private`: Bool?
    public var starred: Bool?
    public var createdAt: NSDate?
    public var updateAt: NSDate?
    public var totalElevationGain: Double?
    public var map: Map?
    public var effortCount: Int?
    public var athleteCount: Int?
    public var hazardous: Bool?
    public var starCount: Int?
    
    /**
     Initializer
     
     - Parameter json: SwiftyJSON object
     - Internal
     **/
    required public init(_ json: JSON) {
        setResourceState(json)
        id = json["id"].int
        name = json["name"].string
        descr = json["description"].string
        activityType = ActivityType(optionalRawValue: json["activity_type"].string)
        distance = json["distance"].double
        averageGrade = json["average_grade"].double
        maximumGrade = json["maximum_grade"].double
        elevationHigh = json["elevation_high"].double
        elevationLow = json["elevation_low"].double
        startLatLng = Location(json["start_latlng"].array)
        endLatLng = Location(json["end_latlng"].array)
        climbCategory = json["climb_category"].int
        city = json["city"].string
        state = json["state"].string
        country = json["country"].string
        `private` = json["private"].bool
        starred = json["starred"].bool
        createdAt = json["created_at"].string?.toDate()
        updateAt = json["updated_at"].string?.toDate()
        totalElevationGain = json["total_elevation_gained"].double
        map = Map(json["map"])
        effortCount = json["effort_count"].int
        athleteCount = json["athlete_count"].int
        hazardous = json["hazardous"].bool
        starCount = json["star_count"].int

    }
}


