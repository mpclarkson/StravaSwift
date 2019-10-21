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
public final class Effort: Strava {
    public let id: Int?
    public let resourceState: ResourceState?
    public let name: String?
    public let activity: MetaActivity?
    public let athlete: Athlete?
    public let elapsedTime: Int?
    public let movingTime: Int?
    public let startDate: Date?
    public let startDateLocal: Date?
    public let distance: Double?
    public let startIndex: Int?
    public let endIndex: Int?
    public let averageCadence: Double?
    public let averageWatts: Double?
    public let deviceWatts: Bool?
    public let averageHeartRate: Double?
    public let maxHeartRate: Int?
    public let segment: Segment?
    public let komRank: Int?
    public let prRank: Int?
    public let hidden: Bool?

    /**
     Initializer

     - Parameter json: SwiftyJSON object
     - Internal
     **/
    required public init(_ json: JSON) {
        id = json["id"].int
        resourceState = json["resource_state"].strava(ResourceState.self)
        name = json["name"].string
        activity = json["activity"].strava(MetaActivity.self)
        athlete = json["athlete"].strava(Athlete.self)
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
        segment = json["segment"].strava(Segment.self)
        komRank = json["kom_rank"].int
        prRank = json["pr_rank"].int
        hidden = json["hidden"].bool
    }
}
