//
//  Router.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import Alamofire

public enum Router {
    
    public typealias Params = [String: AnyObject]?
    
    case Token(String)
    
    case Athlete
    case UpdateAthlete
    case AthleteActivities(Params)
    case AthleteFriends(Params)
    case AthleteFollowers(Params)
    case AthleteClubs(Params)
    
    case Athletes(StravaSwift.Athlete, Params)
    case AthletesFriends(StravaSwift.Athlete, Params)
    case AthletesFollowers(StravaSwift.Athlete, Params)
    case AthletesBothFollowing(StravaSwift.Athlete, Params)
    case AthletesStats(StravaSwift.Athlete, Params)
    case AthletesKoms(StravaSwift.Athlete, Params)
    
    case CreateActivity
    case UpdateActivity(Activity)
    case DeleteActivity(Activity)
    case Activities(Activity, Params)
    case ActivitiesKudos(Activity, Params)
    case ActivitiesComments(Activity, Params)
    case ActivitiesPhotos(Activity, Params)
    case ActivitiesRelated(Activity, Params)
    case ActivitiesFriends(Activity, Params)
    case ActivitiesZones(Activity, Params)
    case ActivitiesLaps(Activity, Params)
    
    case Clubs(Club, Params)
    case ClubsAnnouncements(Club, Params)
    case ClubsEvents(Club, Params)
    case ClubsMembers(Club, Params)
    case ClubsActivities(Club, Params)
    case ClubsJoin(Club)
    case ClubsLeave(Club)
    
    case Gear(StravaSwift.Gear, Params)
    
    case Segments(Segment, Params)
    case SegmentsStarred(Segment, Params)
    case SegmentsEfforts(Segment, Params)
    case SegmentsLeaderboards(Segment, Params)

    case SegmentEfforts(Effort, Params)

    //case SegmentsExplorer
    //case Streams(Activity)"
    //case Uploads
}

extension Router: URLRequestConvertible  {
    
    static var authorizationUrl: NSURL {
        var url = "https://www.strava.com/oauth/authorize?"
        StravaClient.sharedInstance.authParams.forEach {
            url.appendContentsOf("\($0)=\($1)&")
        }
        return NSURL(string: url)!
    }
    
    struct Parameters {
        var set:[String:AnyObject]?
    }
    
    static var deauthorizationUrl: NSURL {
        return NSURL(string: "https://www.strava.com/oauth/deauthorize")!
    }
    
    private var requestConfig: (path: String, params:[String:AnyObject]?, method: Alamofire.Method) {
        switch self {
        case .Token(let code):
            return ("/token", StravaClient.sharedInstance.tokenParams(code), .POST)
        
        case .Athlete:
            return ("/athlete", nil, .GET)
        case .UpdateAthlete:
            return ("/athlete", nil, .PUT)
        case .AthleteFriends(let params):
            return ("/athlete/friends", params, .GET)
        case .AthleteFollowers(let params):
            return ("/athlete/followers", params, .GET)
        case .AthleteClubs(let params):
            return ("/athlete/clubs", params, .GET)
        case .AthleteActivities(let params):
            return ("/athlete/activities", params, .GET)
            
        case .Athletes(let athlete, let params):
            return ("/athletes/\(athlete.id)", params, .GET)
        case .AthletesFriends(let athlete, let params):
            return ("/athletes/\(athlete.id)/friends", params, .GET)
        case .AthletesFollowers(let athlete, let params):
            return ("/athletes/\(athlete.id)/friends", params, .GET)
        case .AthletesBothFollowing(let athlete, let params):
            return ("/athletes/\(athlete.id)/both-following", params, .GET)
        case .AthletesStats(let athlete, let params):
            return ("/athletes/\(athlete.id)/stats", params, .GET)
        case .AthletesKoms(let athlete, let params):
            return ("/athletes/\(athlete.id)/koms", params, .GET)
            
        case .CreateActivity:
            return ("/activities", nil, .POST)
        case .UpdateActivity(let activity):
            return ("/activities/\(activity.id)", nil, .PUT)
        case .DeleteActivity(let activity):
            return ("/activities/\(activity.id)", nil, .DELETE)
            
        case .Activities(let activity, let params):
            return ("/activities/\(activity.id)", params, .GET)
        case .ActivitiesKudos(let activity, let params):
            return ("/activities/\(activity.id)/kudos", params, .GET)
        case .ActivitiesComments(let activity, let params):
            return ("/activities/\(activity.id)/comments", params, .GET)
        case .ActivitiesPhotos(let activity, let params):
            return ("/activities/\(activity.id)/photos/photo_sources=true", params, .GET)
        case .ActivitiesRelated(let activity, let params):
            return ("/activities/\(activity.id)/related", params, .GET)
        case .ActivitiesFriends(let activity, let params):
            return ("/activities/\(activity.id)/following", params, .GET)
        case .ActivitiesZones(let activity, let params):
            return ("/activities/\(activity.id)/zones", params, .GET)
        case .ActivitiesLaps(let activity, let params):
            return ("/activities/\(activity.id)/laps", params, .GET)
            
        case .Clubs(let club, let params):
            return ("/clubs/\(club.id)", params, .GET)
        case .ClubsAnnouncements(let club, let params):
            return ("/clubs/\(club.id)/announcements", params, .GET)
        case .ClubsEvents(let club, let params):
            return ("/clubs/\(club.id)/events", params, .GET)
        case ClubsMembers(let club, let params):
            return ("/clubs/\(club.id)/members", params, .GET)
        case ClubsActivities(let club, let params):
            return ("/clubs/\(club.id)/activities", params, .GET)
        case ClubsJoin(let club):
            return ("/clubs/\(club.id)/join", nil, .POST)
        case ClubsLeave(let club):
            return ("/clubs/\(club.id)/leave", nil, .POST)
       
        case .Segments(let segment, let params):
            return ("/segments/\(segment.id)", params, .GET)
        case SegmentsEfforts(let segment, let params):
            return ("/segments/\(segment.id)/efforts", params, .GET)
        case SegmentsLeaderboards(let segment, let params):
            return ("/segments/\(segment.id)/leaderboard", params, .GET)
        case SegmentsStarred:
            return ("/segments/starred", nil, .GET)
        
        case SegmentEfforts(let effort, let params):
            return ("/segment_efforts/\(effort.id)", params, .GET)
            
        case Gear(let gear, let params):
            return ("/gear/\(gear.id)", params, .GET)
            
//        case .Streams(let activity):
//            return ("/activities/\(activity.id)/streams", nil, .GET)
//        case .Uploads:
//            return ("/uploads/", nil, .GET)
        }
    }
    
    public var URLRequest: NSMutableURLRequest {

        let config = self.requestConfig
        
        var baseURL: NSURL {
            switch self {
            case .Token:
                return NSURL(string: "https://www.strava.com/oauth")!
            default:
                return NSURL(string: "https://www.strava.com/api/v3")!
            }
        }
        
        let URLRequest = NSMutableURLRequest(URL: baseURL.URLByAppendingPathComponent(config.path))
        URLRequest.HTTPMethod = config.method.rawValue
        
        if let token = StravaClient.sharedInstance.token?.accessToken {
            URLRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        let parameters = config.params
        let encoding = Alamofire.ParameterEncoding.JSON
        return encoding.encode(URLRequest, parameters: parameters).0
    }
}

