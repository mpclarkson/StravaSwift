//
//  AthleteStats.swift
//  StravaSwift
//
//  Created by Andy on 01/22/2017
//  Copyright © 2017 Andy Gonzalez. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 Stats are aggregated data for an athlete
 **/
public final class AthleteStats: Strava {

    public final class Totals {

        public let count: Int?
        public let distance: Double?
        public let movingTime: TimeInterval?
        public let elapsedTime: TimeInterval?
        public let elevationGain: Double?
        public let achievementCount: Int?

        required public init(_ json: JSON) {
            count = json["count"].int
            distance = json["distance"].double
            movingTime = json["moving_time"].double
            elapsedTime = json["elapsed_time"].double
            elevationGain = json["elevation_gain"].double
            achievementCount = json["achievement_count"].int
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

    /**
     Initializer

     - Parameter json: SwiftyJSON object
     - Internal
     **/
    required public init(_ json: JSON) {

        biggestRideDistance = json["biggest_ride_distance"].double
        biggestClimbElevationGain = json["biggest_climb_elevation_gain"].double
        recentRideTotals = Totals(json["recent_ride_totals"])
        recentRunTotals = Totals(json["recent_run_totals"])
        recentSwimTotals = Totals(json["recent_swim_totals"])
        ytdRideTotals = Totals(json["ytd_ride_totals"])
        ytdRunTotals = Totals(json["ytd_run_totals"])
        ytdSwimTotals = Totals(json["ytd_swim_totals"])
        allRideTotals = Totals(json["all_ride_totals"])
        allRunTotals = Totals(json["all_run_totals"])
        allSwimTotals = Totals(json["all_swim_totals"])
    }
}
