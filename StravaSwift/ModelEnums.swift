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
    case male = "M", female = "F"
}

/**
 Following status of the athlete
 
 - Pending
 - Accepted
 - Blocked
 **/
public enum FollowingStatus: String {
    case pending = "pending", accepted = "accepted", blocked = "Blocked"
}

/**
 Athlete type
 
 - Cyclist
 - Runner
 **/
public enum AthleteType: Int {
    case cyclist, runner
}

/**
 Measurement units
 
 - Feet
 - Meters
 **/
public enum Units: String {
    case feet = "feet", meters = "meters"
}

/**
 Resource state (describes the detail of the resource)
 
 - Meta
 - Summary
 - Detailed
 **/
public enum ResourceState: Int {
    case meta = 1, summary = 2, detailed = 3
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
    case run = 0, raceRun = 1, longRun = 3, workoutRun = 4
    case ride = 10, raceRide = 11, workoutRide = 12
}

/**
 Activity type
 
  - Ride
  - Run
  - Swim
  - Hike
  - Walk
  - AlpineSki
  - BackcountrySki
  - Canoeing
  - Crossfit
  - EBikeRide
  - Elliptical
  - IceSkate
  - InlineSkate
  - Kayaking
  - Yoga
  - Kitesurf
  - NordicSki 
  - RockClimbing
  - RollerSki
  - Rowing
  - Snowboard
  - Snowshoe
  - StairStepper
  - StandUpPaddling
  - Surfing
  - VirtualRide
  - WeightTraining
  - Windsurf
  - Workout
 **/
public enum ActivityType: String {
    case
    ride, run, swim, hike, walk, alpineSki, backcountrySki, canoeing, crossfit, eBikeRide, elliptical,
    iceSkate, inlineSkate, kayaking, yoga, kitesurf, nordicSki, rockClimbing, rollerSki, rowing,
    snowboard, snowshoe, stairStepper, standUpPaddling, surfing, virtualRide, weightTraining, windsurf, workout
}

/**
 Sport type
 
 - Cycling
 - Running
 - Triathlon
 - Other
 **/
public enum SportType: String {
    case cycling = "cycling", running = "running", triathlon = "triathlon", other = "other"
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
    case casualClub = "casual_club", racingTeam = "racing_team", shop = "shop", company = "company", other = "other"
}

/**
 Frame type (cycling only)
 
 - MTB
 - Cross
 - Road
 - TimeTrial
 **/
public enum FrameType: Int {
    case mtb = 1, cross = 2, road = 3, timeTrial = 4
}

/**
 Resolution type
 
 - Low
 - Medium
 - High
 **/
public enum ResolutionType: String {
    case low = "low", medium = "medium", high = "High"
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
    case time = "time",
    latLng = "latlng",
    distance = "distance",
    altitude = "altitude",
    velocitySmooth = "velocity_smooth",
    heartRate = "heartrate",
    cadence = "cadence",
    watts = "watts",
    temp = "temp",
    moving = "moving",
    gradeSmooth = "grade_smooth"
    
    //Description of the units associated with the stream
    var unit: String {
        switch self {
        case .time:
            return "integer seconds"
        case .latLng:
            return	"floats [latitude, longitude]"
        case .distance:
            return	"float meters"
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
    case casual = 1, tempo = 2, hammerfest = 4
}

/**
 Terrain description
 
 - MostlyFlat
 - RollingHills
 - KillerClimbs
 **/
public enum Terrain: Int {
    case mostlyFlat = 0, rollingHills = 1, killerClimbs = 2
}

/**
 Photo source
 
 - Strava
 - Instagram
 **/
public enum PhotoSource: Int {
    case strava = 1, instagram = 2
}

/**
 Achievement type
 
 - Overall
 - PR
 - YearOverall
 **/
public enum AchievementType: String {
    case overall = "overall", pr = "pr", yearOverall = "year_overall"
}


/** Route type enum **/
public enum RouteType: Int {
    case ride = 1, run = 2
}

/** Route sub type enum **/
public enum RouteSubType: Int {
    case road = 1, mtb = 2, cx = 3, trail = 4, mixed = 5
}

/**
 Data type enum for uploaded activities
 **/
public enum DataType: String {
    case fit = "fit", fitGz = "fit.gz", tcx = "tcx", tcxGz = "tcx.gz", gpx = "gpx", gpxGz = "gpx.gz"
}





