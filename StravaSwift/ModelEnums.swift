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
    case Male = "M", Female = "F"
}

/**
 Following status of the athlete
 
 - Pending
 - Accepted
 - Blocked
 **/
public enum FollowingStatus: String {
    case Pending = "pending", Accepted = "accepted", Blocked = "Blocked"
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
    case Feet = "feet", Meters = "meters"
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
    Ride, Run, Swim, Hike, Walk, AlpineSki, BackcountrySki, Canoeing, Crossfit, EBikeRide, Elliptical,
    IceSkate, InlineSkate, Kayaking, Yoga, Kitesurf, NordicSki, RockClimbing, RollerSki, Rowing,
    Snowboard, Snowshoe, StairStepper, StandUpPaddling, Surfing, VirtualRide, WeightTraining, Windsurf, Workout
}

/**
 Sport type
 
 - Cycling
 - Running
 - Triathlon
 - Other
 **/
public enum SportType: String {
    case Cycling = "cycling", Running = "running", Triathlon = "triathlon", Other = "other"
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
    case CasualClub = "casual_club", RacingTeam = "racing_team", Shop = "shop", Company = "company", Other = "other"
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
    case Low = "low", Medium = "medium", High = "High"
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
    case Time = "time",
    LatLng = "latlng",
    Distance = "distance",
    Altitude = "altitude",
    VelocitySmooth = "velocity_smooth",
    HeartRate = "heartrate",
    Cadence = "cadence",
    Watts = "watts",
    Temp = "temp",
    Moving = "moving",
    GradeSmooth = "grade_smooth"
    
    //Description of the units associated with the stream
    var unit: String {
        switch self {
        case .Time:
            return "integer seconds"
        case .LatLng:
            return	"floats [latitude, longitude]"
        case .Distance:
            return	"float meters"
        case .Altitude:
            return "float meters"
        case .VelocitySmooth:
            return "float meters per second"
        case .HeartRate:
            return "integer BPM"
        case .Cadence:
            return "integer RPM"
        case .Watts:
            return "integer watts"
        case .Temp:
            return "integer degrees Celsius"
        case .Moving:
            return "boolean"
        case .GradeSmooth:
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
    case Overall = "overall", PR = "pr", YearOverall = "year_overall"
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
    case Fit = "fit", FitGz = "fit.gz", Tcx = "tcx", TcxGz = "tcx.gz", Gpx = "gpx", GxpGz = "gpx.gz"
}





