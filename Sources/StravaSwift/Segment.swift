//
//  Segment.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation

/**
  Segments are specific sections of road. Athletes’ times are compared on these segments and leaderboards are created.
 **/
public struct Segment: Decodable {
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
    public let isPrivate: Bool?
    public let starred: Bool?
    public let createdAt: Date?
    public let updatedAt: Date?
    public let totalElevationGain: Double?
    public let map: Map?
    public let effortCount: Int?
    public let athleteCount: Int?
    public let hazardous: Bool?
    public let starCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case resourceState = "resource_state"
        case name
        case descr = "description"
        case activityType = "activity_type"
        case distance
        case averageGrade = "average_grade"
        case maximumGrade = "maximum_grade"
        case elevationHigh = "elevation_high"
        case elevationLow = "elevation_low"
        case startLatLng = "start_latlng"
        case endLatLng = "end_latlng"
        case climbCategory = "climb_category"
        case city
        case state
        case country
        case isPrivate = "private"
        case starred
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case totalElevationGain = "total_elevation_gained"
        case map
        case effortCount = "effort_count"
        case athleteCount = "athlete_count"
        case hazardous
        case starCount = "star_count"
    }
}
