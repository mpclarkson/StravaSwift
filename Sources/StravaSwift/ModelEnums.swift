//
//  ModelEnums.swift
//  StravaSwift
//
//  Created by MATTHEW CLARKSON on 23/05/2016.
//  Copyright © 2016 Matthew Clarkson. All rights reserved.
//


/**
 Athlete's gender

 - Male
 - Female
**/
public enum Sex: String {
    case male = "M"
    case female = "F"
}

/**
 Following status of the athlete

 - Pending
 - Accepted
 - Blocked
 **/
public enum FollowingStatus: String {
    case accepted
    case blocked
    case pending
}

/**
 Membership status for a club

 - Pending
 - Accepted
 **/
public enum MembershipStatus: String {
    case member
    case pending
}

/**
 Measurement units

 - Feet
 - Meters
 **/
public enum Units: String {
    case feet
    case meters
}

/**
 Resource state (describes the detail of the resource)

 - Meta
 - Summary
 - Detailed
 **/
public enum ResourceState: Int {
    case meta = 1
    case summary = 2
    case detailed = 3
}

/**
 Workout type

 - Run
 - RaceRun
 - LongRun
 - WorkOutRun
 - Ride
 - RaceRide
 - WorkoutRide
 **/
public enum WorkoutType: Int {
    case run = 0
    case raceRun = 1
    case longRun = 3
    case workoutRun = 4
    case ride = 10
    case raceRide = 11
    case workoutRide = 12
}

/**
 Activity type

  - AlpineSki
  - BackcountrySki
  - Canoeing
  - Crossfit
  - EBikeRide
  - Elliptical
  - Golf
  - Handcycle
  - Hike
  - IceSkate
  - InlineSkate
  - Kayaking
  - Kitesurf
  - NordicSki
  - Ride
  - RockClimbing
  - RollerSki
  - Rowing
  - Run
  - Sail
  - Skateboard
  - Snowboard
  - Snowshoe
  - Soccer
  - StairStepper
  - StandUpPaddling
  - Surfing
  - Swim
  - Velomobile
  - VirtualRide
  - VirtualRun
  - Walk
  - WeightTraining
  - Wheelchair
  - Windsurf
  - Workout
  - Yoga
 **/
public enum ActivityType: String {
    case alpineSki = "AlpineSki"
    case backcountrySki = "BackcountrySki"
    case canoeing = "Canoeing"
    case crossfit = "Crossfit"
    case eBikeRide = "EBikeRide"
    case elliptical = "Elliptical"
    case golf = "Golf"
    case handcycle = "Handcycle"
    case hike = "Hike"
    case iceSkate = "IceSkate"
    case inlineSkate = "InlineSkate"
    case kayaking = "Kayaking"
    case kitesurf = "Kitesurf"
    case nordicSki = "NordicSki"
    case ride = "Ride"
    case rockClimbing = "RockClimbing"
    case rollerSki = "RollerSki"
    case rowing = "Rowing"
    case run = "Run"
    case sail = "Sail"
    case skateboard = "Skateboard"
    case snowboard = "Snowboard"
    case snowshoe = "Snowshoe"
    case soccer = "Soccer"
    case stairStepper = "StairStepper"
    case standUpPaddling = "StandUpPaddling"
    case surfing = "Surfing"
    case swim = "Swim"
    case velomobile = "Velomobile"
    case virtualRide = "VirtualRide"
    case virtualRun = "VirtualRun"
    case walk = "Walk"
    case weightTraining = "WeightTraining"
    case wheelchair = "Wheelchair"
    case windsurf = "Windsurf"
    case workout = "Workout"
    case yoga = "Yoga"
}

/**
 Sport type

 - Cycling
 - Running
 - Triathlon
 - Other
 **/
public enum SportType: String {
    case cycling
    case running
    case triathlon
    case other
}

/**
 Club type

 - CasualClub
 - RacingTeam
 - Shop
 - Company
 - Other
 **/
public enum ClubType: String {
    case casualClub = "casual_club"
    case racingTeam = "racing_team"
    case shop
    case company
    case other
}

/**
 Frame type (cycling only)

 - MTB
 - Cross
 - Road
 - TimeTrial
 **/
public enum FrameType: Int {
    case mtb = 1
    case cross = 2
    case road = 3
    case timeTrial = 4
}

/**
 Resolution type

 - Low
 - Medium
 - High
 **/
public enum ResolutionType: String {
    case low
    case medium
    case high
}

/**
 Stream type (ie the data type)

 - Time
 - LatLng
 - Distance
 - Altitude
 - VelocitySmooth
 - HeartRate
 - Cadence
 - Watts
 - Temp
 - Moving
 - GradeSmooth
 **/
public enum StreamType: String {
    case time
    case latLng = "latlng"
    case distance
    case altitude
    case velocitySmooth = "velocity_smooth"
    case heartRate = "heartrate"
    case cadence
    case watts
    case temp
    case moving
    case gradeSmooth = "grade_smooth"

    //Description of the units associated with the stream
    var unit: String {
        switch self {
        case .time:
            return "integer seconds"
        case .latLng:
            return "floats [latitude, longitude]"
        case .distance:
            return "float meters"
        case .altitude:
            return "float meters"
        case .velocitySmooth:
            return "float meters per second"
        case .heartRate:
            return "integer BPM"
        case .cadence:
            return "integer RPM"
        case .watts:
            return "integer watts"
        case .temp:
            return "integer degrees Celsius"
        case .moving:
            return "boolean"
        case .gradeSmooth:
            return "float percent"
        }
    }
}

/**
 Skill level

 - Casual
 - Tempo
 - Hammerfest
 **/
public enum SkillLevel: Int {
    case casual = 1
    case tempo = 2
    case hammerfest = 4
}

/**
 Terrain description

 - MostlyFlat
 - RollingHills
 - KillerClimbs
 **/
public enum Terrain: Int {
    case mostlyFlat
    case rollingHills
    case killerClimbs
}

/**
 Photo source

 - Strava
 - Instagram
 **/
public enum PhotoSource: Int {
    case strava = 1
    case instagram = 2
}

/**
 Achievement type

 - Overall
 - PR
 - YearOverall
 **/
public enum AchievementType: String {
    case overall
    case pr
    case yearOverall = "year_overall"
}

/** Route type enum **/
public enum RouteType: Int {
    case ride = 1
    case run = 2
}

/** Route sub type enum **/
public enum RouteSubType: Int {
    case road = 1
    case mtb = 2
    case cx = 3
    case trail = 4
    case mixed = 5
}

/**
 Data type enum for uploaded activities
 **/
public enum DataType: String {
    case fit
    case fitGz = "fit.gz"
    case tcx
    case tcxGz = "tcx.gz"
    case gpx
    case gpxGz = "gpx.gz"
}
