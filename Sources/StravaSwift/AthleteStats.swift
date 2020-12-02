//
//  AthleteStats.swift
//  StravaSwift
//
//  Created by Andy on 01/22/2017
//  Copyright © 2017 Andy Gonzalez. All rights reserved.
//

import Foundation

/**
 Stats are aggregated data for an athlete
 **/
public struct AthleteStats: Decodable {

    public struct Totals: Decodable {

        public let count: Int?
        public let distance: Double?
        public let movingTime: TimeInterval?
        public let elapsedTime: TimeInterval?
        public let elevationGain: Double?
        public let achievementCount: Int?
        
        enum CodingKeys: String, CodingKey {
            case count
            case distance
            case movingTime = "moving_time"
            case elapsedTime = "elapsed_time"
            case elevationGain = "elevation_gain"
            case achievementCount = "achievement_count"
        }
    }

    public let biggestRideDistance: Double?
    public let biggestClimbElevationGain: Double?
    public let recentRideTotals: Totals?
    public let recentRunTotals: Totals?
    public let recentSwimTotals: Totals?
    public let ytdRideTotals: Totals?
    public let ytdRunTotals: Totals?
    public let ytdSwimTotals: Totals?
    public let allRideTotals: Totals?
    public let allRunTotals: Totals?
    public let allSwimTotals: Totals?
    
    enum CodingKeys: String, CodingKey {
        case biggestRideDistance = "biggest_ride_distance"
        case biggestClimbElevationGain = "biggest_climb_elevation_gain"
        case recentRideTotals = "recent_ride_totals"
        case recentRunTotals = "recent_run_totals"
        case recentSwimTotals = "recent_swim_totals"
        case ytdRideTotals = "ytd_ride_totals"
        case ytdRunTotals = "ytd_run_totals"
        case ytdSwimTotals = "ytd_swim_totals"
        case allRideTotals = "all_ride_totals"
        case allRunTotals = "all_run_totals"
        case allSwimTotals = "all_swim_totals"
    }
}
