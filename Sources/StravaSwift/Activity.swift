//
//  Activity.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 Achievement class - a detailed representation is returned if the activity is owned by the requesting athlete, otherwise
 a summary representation is returned for all other requests.

 Activity details, including segment efforts, splits and best efforts, are only available to the owner of the activity.

 By default, only “important” efforts are included. “Importance” is based on a number of factors and its value may change over time.

 **/
public final class Activity: Strava {

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
    public let `private`: Bool?
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


    /**
     Initializer

     - Parameter json: SwiftyJSON object
     - Internal
     **/
    required public init(_ json: JSON) {
        id = json["id"].int
        resourceState = json["resource_state"].strava(ResourceState.self)
        externalId = json["external_id"].string
        uploadId = json["upload_id"].int
        athlete = json["athlete"].strava(Athlete.self)
        name = json["name"].string
        description = json["description"].string
        distance = json["distance"].double
        movingTime = json["moving_time"].double
        elapsedTime = json["elapsed_time"].double
        lowElevation = json["elev_low"].double
        highElevation = json["elev_high"].double
        totalElevationGain = json["total_elevation_gain"].double
        type = json["type"].strava(ActivityType.self)
        startDate = json["start_date"].string?.toDate()
        startDateLocal = json["start_date_local"].string?.toDate()
        startLatLng = json["start_latlng"].strava(Location.self)
        endLatLng = json["end_latlng"].strava(Location.self)
        achievementCount = json["achievement_count"].int
        kudosCount = json["kudos_count"].int
        commentCount = json["comment_count"].int
        athleteCount = json["athlete_count"].int
        photoCount = json["php_count"].int
        totalPhotoCount = json["total_photo_count"].int
        photos = json["photos"].strava(Photo.self)
        trainer = json["trainer"].bool
        commute = json["commute"].bool
        manual = json["manual"].bool
        `private` = json["private"].bool
        flagged = json["flagged"].bool
        workoutType = json["workout_type"].strava(WorkoutType.self)
        gear = json["gear"].strava(Gear.self)
        averageSpeed = json["average_speed"].double
        maxSpeed = json["max_speed"].double
        calories = json["calories"].double
        hasKudoed = json["has_kudoed"].bool
        segmentEfforts = json["segment_efforts"].strava(Effort.self)
        splitsMetric = json["splits_metric"].strava(Split.self)
        splitsStandard = json["splits_standard"].strava(Split.self)
        bestEfforts = json["best_efforts"].strava(Split.self)
        map = json["map"].strava(Map.self)
        timeZone = json["timezone"].string
        kiloJoules = json["kilojoules"].double
        averagePower = json["average_watts"].double
        maxPower = json["max_watts"].double
        deviceWatts = json["device_watts"].bool
        hasHeartRate = json["has_heartrate"].bool
        averageHeartRate = json["average_heartrate"].double
        maxHeartRate = json["max_heartrate"].double
    }
}

// MetaActivity is used by Effort to hold unique Activity ID
public final class MetaActivity: Strava {
    public let id: Int?

    required public init(_ json: JSON) {
        id = json["id"].int
    }
}
