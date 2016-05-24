//
//  ModelEnums.swift
//  StravaSwift
//
//  Created by MATTHEW CLARKSON on 23/05/2016.
//  Copyright © 2016 Matthew Clarkson. All rights reserved.
//

public enum Sex: String {
    case Mail = "M", Female = "F"
}

public enum FollowingStatus: String {
    case Pending = "pending", Accepted = "accepted", Blocked = "Blocked"
}

public enum AthleteType: Int {
    case Cyclist, Runner
}

public enum Units: String {
    case Feet = "feet", Meters = "meters"
}

public enum ResourceState: Int {
    case Meta = 1, Summary = 2, Detailed = 3
}

public enum WorkoutType: Int {
    case Run = 0, RaceRun = 1, LongRun = 3, WorkoutRun = 4
    case Ride = 10, RaceRide = 11, WorkoutRide = 12
}

public enum ActivityType: String {
    case
    Ride, Run, Swim, Hike, Walk, AlpineSki, BackcountrySki, Canoeing, Crossfit, EBikeRide, Elliptical,
    IceSkate, InlineSkate, Kayaking, Yoga, Kitesurf, NordicSki, RockClimbing, RollerSki, Rowing,
    Snowboard, Snowshoe, StairStepper, StandUpPaddling, Surfing, VirtualRide, WeightTraining, Windsurf, Workout
}

public enum SportType: String {
    case Cycling = "cycling", Running = "running", Triathlon = "triathlon", Other = "other"
}

public enum ClubType: String {
    case CasualClub = "casual_club", RacingTeam = "racing_team", Shop = "shop", Company = "company", Other = "other"
}

public enum FrameType: Int {
    case MTB = 1, Cross = 2, Road = 3, TimeTrial = 4
}


public enum ResolutionType: String {
    case Low = "low", Medium = "medium", High = "Hight"
}

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

public enum SkillLevel: Int {
    case Casual = 1, Tempo = 2, Hammerfest = 4
}

public enum Terrain: Int {
    case MostlyFlat = 0, RollingHills = 1, KillerClimbs = 2
}

public enum PhotoSource: Int {
    case Strava = 1, Instagram = 2
}

public enum AchievementType: String {
    case Overall = "overall", PR = "pr", YearOverall = "year_overall"
}




