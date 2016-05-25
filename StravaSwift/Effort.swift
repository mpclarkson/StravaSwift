//
//  Effort.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 A segment effort represents an athlete’s attempt at a segment. It can also be thought of as a portion of a ride that covers a segment. The object is returned in summary or detailed representations. They are currently the same.
 **/
public class Effort: Strava, StravaResourceState {
    public var id: Int?
    public var resourceState: ResourceState?
    public var name: String?
    public var activity: Activity?
    public var athlete: Athlete?
    public var elapsedTime: Int?
    public var movingTime: Int?
    public var startDate: NSDate?
    public var startDateLocal: NSDate?
    public var distance: Double?
    public var startIndex: Int?
    public var endIndex: Int?
    public var averageCadence: Double?
    public var averageWatts: Double?
    public var deviceWatts: Bool?
    public var averageHeartRate: Double?
    public var maxHeartRate: Int?
    public var segment: Segment?
    public var komRank: Int?
    public var prRank: Int?
    public var hidden: Bool?
    
    required public init(_ json: JSON) {
        setResourceState(json)
        id = json["id"].int
        name = json["name"].string
        activity = Activity(json["activity_type"])
        athlete = Athlete(json["athlete"])
        elapsedTime = json["elapsed_time"].int
        movingTime = json["moving_time"].int
        startDate = json["start_date"].string?.toDate()
        startDateLocal = json["start_date_local"].string?.toDate()
        distance = json["distance"].double
        startIndex = json["start_index"].int
        endIndex = json["end_index"].int
        averageCadence = json["average_cadence"].double
        averageWatts = json["average_watts"].double
        deviceWatts = json["device_watts"].bool
        averageHeartRate = json["average_heartrate"].double
        maxHeartRate = json["max_heartrate"].int
        segment = Segment(json["segment"])
        komRank = json["kom_rank"].int
        prRank = json["pr_rank"].int
        hidden = json["hidden"].bool
    }
}
