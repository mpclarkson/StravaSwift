//
//  Router.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import Alamofire

/**
 Router enum for type safe routing. For information on how this is used please [see here](https://github.com/Alamofire/Alamofire#api-parameter-abstraction).
 **/
public enum Router {
    
    public typealias Params = [String: AnyObject]?
    
    /**
     Requests a Strava OAuth token
     - parameter code: the code returned from Strava after granting access to the application
    **/
    case Token(String)
    
    /**
     Allows an application to revoke its access to an athlete’s data. This will invalidate all access tokens associated with the ‘athlete,application’ pair used to create the token. The application will be removed from the Athlete Settings page on Strava. All requests made using invalidated tokens will receive a 401 Unauthorized response.
     - parameter token: the access token to deauthorize
     **/
    case Deauthorize(String)
  
    /**
     Gets the current user/athlete
     **/
    case Athlete
    
    /**
     Updates the current user/athlete
     **/
    case UpdateAthlete
    
    /**
     Lists the current user/athlete's activities
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case AthleteActivities(Params)
    
    /**
     Lists the current user/athlete's friends
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case AthleteFriends(Params)
    
    /**
     Lists the current user/athlete's followers
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case AthleteFollowers(Params)
    
    /**
     Lists the current user/athlete's clubs
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case AthleteClubs(Params)
    
    /**
    Gets a specific athlete
    - parameter athlete: an Athlete object
    - parameter params: a [String: String] dictionary of acceptable parameters
    **/
    case Athletes(StravaSwift.Athlete, Params)
    
    /**
     Lists a specific athlete's friends
     - parameter athlete: an Athlete object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case AthletesFriends(StravaSwift.Athlete, Params)
    
    /**
     Lists a specific athlete's followers
     - parameter athlete: an Athlete object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case AthletesFollowers(StravaSwift.Athlete, Params)
    
    /**
     Lists athletes the current user and the requested athlete are both following
     - parameter athlete: an Athlete object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case AthletesBothFollowing(StravaSwift.Athlete, Params)
    
    /**
     Gets the statistics for a specific athlete
     - parameter athlete: an Athlete object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case AthletesStats(StravaSwift.Athlete, Params)
    
    /**
     Lists the specific athlete's KOMS
     - parameter athlete: an Athlete object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case AthletesKoms(StravaSwift.Athlete, Params)
    
    /**
     Creates a new manual activity in Strava for the athlete (not for uploading files)
     - parameter params: a [String: String] dictionary representing the activity
     **/
    case CreateActivity(Params)
    
    /**
     Updates an activity, requires write permissions
     - parameter activity: an Activity object
     **/
    case UpdateActivity(Activity)
    
    /**
     Deletes an activity, requires write permissions
     - parameter activity: an Activity object
     **/
    case DeleteActivity(Activity)
    
    /**
     Gets an activity
     - parameter activity: an Activity object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case Activities(Activity, Params)
    
    /**
     Lists kudos for an activity
     - parameter activity: an Activity object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ActivitiesKudos(Activity, Params)
    
    /**
     Lists comments for an activity
     - parameter activity: an Activity object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ActivitiesComments(Activity, Params)
    
    /**
     Lists photos for an activity
     - parameter activity: an Activity object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ActivitiesPhotos(Activity, Params)
    
    /**
     Lists related activities
     - parameter activity: an Activity object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ActivitiesRelated(Activity, Params)
    
    /**
     List the recent activities performed by the current athlete and those they are following. Pagination is supported. However, results are limited to the last 200 total activities.
     - parameter activity: an Activity object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ActivitiesFriends(Activity, Params)
    
    /**
     Heartrate and power zones are set by the athlete. This endpoint returns the time (seconds) in each zone. The distribution is not customizable. Requires an access token associated with the owner of the activity and the owner must be a premium user.
     - parameter activity: an Activity object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ActivitiesZones(Activity, Params)
    
    /**
     Lists all laps associated with an activity
     - parameter activity: an Activity object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ActivitiesLaps(Activity, Params)
    
    /**
     Retrieves a club
     - parameter club: a Club object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case Clubs(Club, Params)
    
    /**
     Lists announcments for a club
     - parameter club: a Club object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ClubsAnnouncements(Club, Params)
    
    /**
     Lists events for a club
     - parameter club: a Club object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ClubsEvents(Club, Params)
    
    /**
     Lists members of a club
     - parameter club: a Club object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ClubsMembers(Club, Params)
    
    /**
     Lists activities by club members
     - parameter club: a Club object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ClubsActivities(Club, Params)
    
    /**
     Join a club (ie the current athlete)
     - parameter club: a Club object
     **/
    case ClubsJoin(Club)
    
    /**
     Leave a club (ie the current athlete)
     - parameter club: a Club object
     **/
    case ClubsLeave(Club)
    
    /**
     List the current athlete's gear
     - parameter club: a club object
     **/
    case Gear(StravaSwift.Gear, Params)
    
    /**
     Retrieves a segment
     - parameter segment: a Segment object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case Segments(Segment, Params)
    
    /**
     Lists segments the current athlete has starred
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case SegmentsStarred(Params)
    
    /**
     Lists efforts for a segment
     - parameter segment: a Segment object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case SegmentsEfforts(Segment, Params)
    
    /**
     Lists the leaderboards for a segment
     - parameter segment: a Segment object
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case SegmentsLeaderboards(Segment, Params)

    /**
     Retrieve details about a specific segment effort. The effort must be public or it must correspond to the current athlete.
     - parameter segment: an EffortObject
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
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
    
    private var requestConfig: (path: String, params:[String:AnyObject]?, method: Alamofire.Method) {
        switch self {
        case .Token(let code):
            return ("/token", StravaClient.sharedInstance.tokenParams(code), .POST)
        case .Deauthorize(let token):
            let params = ["access_token" : token]
            return ("/deauthorize", params, .POST)
        
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
            
        case .CreateActivity(let params):
            return ("/activities", params, .POST)
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
            case .Token, .Deauthorize:
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

