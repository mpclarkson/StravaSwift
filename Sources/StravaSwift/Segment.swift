// Segment.swift
// Copyright (c) 2021 Copilot

import Foundation
import SwiftyJSON

/**
  Segments are specific sections of road. Athletes’ times are compared on these segments and leaderboards are created.
 **/
public struct Segment: Strava, Hashable {
    
    public let id: Int?
    public let name: String?
    public let descr: String?
    public let resourceState: ResourceState?
    public let activityType: ActivityType?
    public let distance: Double?
    public let averageGrade: Double?
    public let maximumGrade: Double?
    public let elevationHigh: Double?
    public let elevationLow: Double?
    public let startLatLng: Location?
    public let endLatLng: Location?
    public let climbCategory: Int?
    public let city: String?
    public let state: String?
    public let country: String?
    public let `private`: Bool?
    public let starred: Bool?
    public let createdAt: Date?
    public let updateAt: Date?
    public let totalElevationGain: Double?
    public let map: Map?
    public let effortCount: Int?
    public let athleteCount: Int?
    public let hazardous: Bool?
    public let starCount: Int?

    /**
     Initializer

     - Parameter json: SwiftyJSON object
     - Internal
     **/
    public init(_ json: JSON) {
        id = json["id"].int
        resourceState = json["resource_state"].strava(ResourceState.self)
        name = json["name"].string
        descr = json["description"].string
        activityType = json["activity_type"].strava(ActivityType.self)
        distance = json["distance"].double
        averageGrade = json["average_grade"].double
        maximumGrade = json["maximum_grade"].double
        elevationHigh = json["elevation_high"].double
        elevationLow = json["elevation_low"].double
        startLatLng = json["start_latlng"].strava(Location.self)
        endLatLng = json["end_latlng"].strava(Location.self)
        climbCategory = json["climb_category"].int
        city = json["city"].string
        state = json["state"].string
        country = json["country"].string
        `private` = json["private"].bool
        starred = json["starred"].bool
        createdAt = json["created_at"].string?.toDate()
        updateAt = json["updated_at"].string?.toDate()
        totalElevationGain = json["total_elevation_gained"].double
        map = json["map"].strava(Map.self)
        effortCount = json["effort_count"].int
        athleteCount = json["athlete_count"].int
        hazardous = json["hazardous"].bool
        starCount = json["star_count"].int
    }
}
