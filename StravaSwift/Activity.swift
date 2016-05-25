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
public class Activity: Strava, StravaResourceState {
    
    public typealias Speed = Double
    public typealias Count = Int
    
    public var id: Int?
    public var resourceState: ResourceState?
    public var externalId: String?
    public var uploadId: Int?
    public var athlete: Athlete?
    public var name: String?
    public var description: String?
    public var distance: Double?
    public var movingTime: NSTimeInterval?
    public var elapsedTime: NSTimeInterval?
    public var totalElevationGain: Double?
    public var type: ActivityType?
    public var startDate: NSDate?
    public var startDateLocal: NSDate?
    public var timeZone: NSTimeZone?
    public var startLatLng: Location?
    public var endLatLng: Location?
    public var achievementCount: Count?
    public var kudosCount: Count?
    public var commentCount: Count?
    public var athleteCount: Count?
    public var photoCount: Count?
    public var totalPhotoCount: Count?
    public var photos: [Photo]?
    public var trainer: Bool?
    public var commute: Bool?
    public var manual: Bool?
    public var `private`: Bool?
    public var flagged: Bool?
    public var workoutType: WorkoutType?
    public var gear: Gear?
    public var averageSpeed: Speed?
    public var maxSpeed: Speed?
    public var calories: Double?
    public var hasKudoed: Bool?
    public var segmentEfforts: [Effort]?
    public var splitsMetric: [Split]?
    public var splitsStandard: [Split]?
    public var bestEfforts: [Split]?

    /**
     Initializer
     
     - Parameter json: SwiftyJSON object
     - Internal
     **/
    required public init(_ json: JSON) {
        setResourceState(json)
        id = json["id"].int
        externalId = json["external_id"].string
        uploadId = json["upload_id"].int
        athlete = Athlete(json["athlete"])
        name = json["name"].string
        description = json["description"].string
        distance = json["distance"].double
        movingTime = json["moving_time"].double
        elapsedTime = json["elapsed_time"].double
        totalElevationGain = json["total_elevation_gain"].double
        type = ActivityType(optionalRawValue: json["type"].string)
        startDate = json["start_date"].string?.toDate()
        startDateLocal = json["start_date_local"].string?.toDate()
        startLatLng = Location(json["start_latlng"].arrayValue)
        endLatLng = Location(json["end_latlng"].arrayValue)
        achievementCount = json["achievement_count"].int
        kudosCount = json["kudos_count"].int
        commentCount = json["comment_count"].int
        athleteCount = json["athlete_count"].int
        photoCount = json["php_count"].int
        totalPhotoCount = json["total_photo_count"].int
        photos = json["photos"].array?.flatMap { Photo($0) }
        trainer = json["trainer"].bool
        commute = json["commute"].bool
        manual = json["manual"].bool
        `private` = json["private"].bool
        flagged = json["flagged"].bool
        workoutType = WorkoutType(optionalRawValue: json["workout_type"].int)
        gear = Gear(json["gear"])
        averageSpeed = json["average_speed"].double
        maxSpeed = json["max_speed"].double
        calories = json["calories"].double
        hasKudoed = json["has_kudoed"].bool
        segmentEfforts = json["segment_efforts"].array?.flatMap { Effort($0) }
        splitsMetric = json["splits_metric"].array?.flatMap { Split($0) }
        splitsStandard = json["splits_standard"].array?.flatMap { Split($0) }
        bestEfforts = json["best_efforts"].array?.flatMap { Split($0) }
    }
}
