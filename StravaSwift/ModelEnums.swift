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
    case Cyclist, Runner
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
    case Meta = 1, Summary = 2, Detailed = 3
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
    case Run = 0, RaceRun = 1, LongRun = 3, WorkoutRun = 4
    case Ride = 10, RaceRide = 11, WorkoutRide = 12
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
    case MTB = 1, Cross = 2, Road = 3, TimeTrial = 4
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
        case Time:
            return "integer seconds"
        case LatLng:
            return	"floats [latitude, longitude]"
        case Distance:
            return	"float meters"
        case Altitude:
            return "float meters"
        case VelocitySmooth:
            return "float meters per second"
        case HeartRate:
            return "integer BPM"
        case Cadence:
            return "integer RPM"
        case Watts:
            return "integer watts"
        case Temp:
            return "integer degrees Celsius"
        case Moving:
            return "boolean"
        case GradeSmooth:
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
    case Casual = 1, Tempo = 2, Hammerfest = 4
}

/**
 Terrain description
 
 - MostlyFlat
 - RollingHills
 - KillerClimbs
 **/
public enum Terrain: Int {
    case MostlyFlat = 0, RollingHills = 1, KillerClimbs = 2
}

/**
 Photo source
 
 - Strava
 - Instagram
 **/
public enum PhotoSource: Int {
    case Strava = 1, Instagram = 2
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
    case Ride = 1, Run = 2
}

/** Route sub type enum **/
public enum RouteSubType: Int {
    case Road = 1, MTB = 2, CX = 3, Trail = 4, Mixed = 5
}





