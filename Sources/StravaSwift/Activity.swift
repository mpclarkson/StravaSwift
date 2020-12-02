//
//  Activity.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation

/**
 Achievement struct - a detailed representation is returned if the activity is owned by the requesting athlete, otherwise
 a summary representation is returned for all other requests.

 Activity details, including segment efforts, splits and best efforts, are only available to the owner of the activity.

 By default, only “important” efforts are included. “Importance” is based on a number of factors and its value may change over time.

 **/
public struct Activity: Decodable {

    public typealias Speed = Double
    public typealias Count = Int

    public let id: Int?
    public let resourceState: ResourceState?
    public let externalId: String?
    public let uploadId: Int?
    public let athlete: Athlete?
    public let name: String?
    public let description: String?
    public let distance: Double?
    public let movingTime: TimeInterval?
    public let elapsedTime: TimeInterval?
    public let highElevation : Double?
    public let lowElevation : Double?
    public let totalElevationGain: Double?
    public let type: ActivityType?
    public let startDate: Date?
    public let startDateLocal: Date?
    public let timeZone: String?
    public let startLatLng: Location?
    public let endLatLng: Location?
    public let achievementCount: Count?
    public let kudosCount: Count?
    public let commentCount: Count?
    public let athleteCount: Count?
    public let photoCount: Count?
    public let totalPhotoCount: Count?
    public let photos: [Photo]?
    public let map: Map?
    public let trainer: Bool?
    public let commute: Bool?
    public let manual: Bool?
    public let isPrivate: Bool?
    public let flagged: Bool?
    public let workoutType: WorkoutType?
    public let gear: Gear?
    public let averageSpeed: Speed?
    public let maxSpeed: Speed?
    public let calories: Double?
    public let hasKudoed: Bool?
    public let segmentEfforts: [Effort]?
    public let splitsMetric: [Split]?
    public let splitsStandard: [Split]?
    public let bestEfforts: [Split]?
    public let kiloJoules: Double?
    public let averagePower : Double?
    public let maxPower : Double?
    public let deviceWatts : Bool?
    public let hasHeartRate : Bool?
    public let averageHeartRate : Double?
    public let maxHeartRate : Double?

    enum CodingKeys: String, CodingKey {
        case id
        case resourceState = "resource_state"
        case externalId = "external_id"
        case uploadId = "upload_id"
        case athlete
        case name
        case description
        case distance
        case movingTime = "moving_time"
        case elapsedTime = "elapsed_time"
        case lowElevation = "elev_low"
        case highElevation = "elev_high"
        case totalElevationGain = "total_elevation_gain"
        case startDate = "start_date"
        case startDateLocal = "start_date_local"
        case startLatLng = "start_latlng"
        case endLatLng = "end_latlng"
        case achievementCount = "achievement_count"
        case kudosCount = "kudos_count"
        case commentCount = "comment_count"
        case athleteCount = "athlete_count"
        case photoCount = "php_count"
        case totalPhotoCount = "total_photo_count"
        case photos
        case trainer
        case commute
        case manual
        case isPrivate = "private"
        case flagged
        case workoutType = "workout_type"
        case gear
        case averageSpeed = "average_speed"
        case maxSpeed = "max_speed"
        case calories
        case hasKudoed = "has_kudoed"
        case segmentEfforts = "segment_efforts"
        case splitsMetric = "splits_metric"
        case splitsStandard = "splits_standard"
        case bestEfforts = "best_efforts"
        case map
        case timeZone
        case kiloJoules
        case averagePower = "average_watts"
        case maxPower = "max_watts"
        case deviceWatts = "device_watts"
        case hasHeartRate = "has_heartrate"
        case averageHeartRate = "average_heartrate"
        case maxHeartRate = "max_heartrate"
        case type
    }
}

// MetaActivity is used by Effort to hold unique Activity ID
public struct MetaActivity: Decodable {
    public let id: Int?
}
