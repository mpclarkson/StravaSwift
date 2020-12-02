//
//  Effort.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation

/**
 A segment effort represents an athlete’s attempt at a segment. It can also be thought of as a portion of a ride that covers a segment. The object is returned in summary or detailed representations. They are currently the same.
 **/
public struct Effort: Decodable {
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

    enum CodingKeys: String, CodingKey {
        case id
        case resourceState = "resource_state"
        case name
        case activity
        case athlete
        case elapsedTime = "elapsed_time"
        case movingTime = "moving_time"
        case startDate = "start_date"
        case startDateLocal = "start_date_local"
        case distance
        case startIndex = "start_index"
        case endIndex = "end_index"
        case averageCadence = "average_cadence"
        case averageWatts = "average_watts"
        case deviceWatts = "device_watts"
        case averageHeartRate = "average_heartrate"
        case segment
        case komRank = "kom_rank"
        case prRank = "pr_rank"
        case hidden
        case maxHeartRate = "max_heartrate"
    }
}
