//
//  Router.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/**
 Router enum for type safe routing. For information on how this is used please [see here](https://github.com/Alamofire/Alamofire#api-parameter-abstraction).
 **/
public enum Router {
    
    public typealias Id = Int
    public typealias Params = [String: AnyObject]?
    
    /**
     Requests a Strava OAuth token
     
     - parameter code: the code returned from Strava after granting access to the application
     **/
    case Token(code: String)
    
    /**
     Allows an application to revoke its access to an athlete’s data. This will invalidate all access tokens associated with the ‘athlete,application’ pair used to create the token. The application will be removed from the Athlete Settings page on Strava. All requests made using invalidated tokens will receive a 401 Unauthorized response.
     
     - parameter token: the access token to deauthorize
     **/
    case Deauthorize(accessToken: String)
    
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
    case AthleteActivities(params: Params)
    
    /**
     Lists the current user/athlete's friends
     
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case AthleteFriends(params:Params)
    
    /**
     Lists the current user/athlete's followers
     
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case AthleteFollowers(params: Params)
    
    /**
     Lists the current user/athlete's clubs
     
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case AthleteClubs(params: Params)
    
    /**
     Gets a specific athlete
     
     - parameter id: the athlete id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case Athletes(id: Id, params: Params)
    
    /**
     Lists a specific athlete's friends
     
     - parameter id: the athlete id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case AthletesFriends(id: Id, params: Params)
    
    /**
     Lists a specific athlete's followers
     
     - parameter id: the athlete id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case AthletesFollowers(id: Id, params: Params)
    
    /**
     Lists athletes the current user and the requested athlete are both following
     
     - parameter id: the athlete id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case AthletesBothFollowing(id: Id, params: Params)
    
    /**
     Gets the statistics for a specific athlete
     
     - parameter id: the athlete id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case AthletesStats(id: Id, params: Params)
    
    /**
     Lists the specific athlete's KOMS
     
     - parameter id: the athlete id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case AthletesKoms(id: Id, params: Params)
    
    /**
     Creates a new manual activity in Strava for the athlete (not for uploading files)
     
     - parameter params: a [String: String] dictionary representing the activity
     **/
    case CreateActivity(params: Params)
    
    /**
     Updates an activity, requires write permissions
     - parameter activity: an Activity object
     **/
    case UpdateActivity(activity: Activity)
    
    /**
     Deletes an activity, requires write permissions
     
     - parameter activity: an Activity object
     **/
    case DeleteActivity(activity: Activity)
    
    /**
     Gets an activity
     
     - parameter id: the activity id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case Activities(id: Id, params: Params)
    
    /**
     Lists kudos for an activity
     
     - parameter id: the activity id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ActivitiesKudos(id: Id, params: Params)
    
    /**
     Lists comments for an activity
     
     - parameter id: the activity id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ActivitiesComments(id: Id, params: Params)
    
    /**
     Lists photos for an activity
     
     - parameter id: the activity id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ActivitiesPhotos(id: Id, params: Params)
    
    /**
     Lists related activities
     
     - parameter id: the activity id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ActivitiesRelated(id: Id, params: Params)
    
    /**
     List the recent activities performed by the current athlete and those they are following. Pagination is supported. However, results are limited to the last 200 total activities.
     
     - parameter id: the activity id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ActivitiesFriends(id: Id, params: Params)
    
    /**
     Heartrate and power zones are set by the athlete. This endpoint returns the time (seconds) in each zone. The distribution is not customizable. Requires an access token associated with the owner of the activity and the owner must be a premium user.
     
     - parameter id: the activity id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ActivitiesZones(id: Id, params: Params)
    
    /**
     Lists all laps associated with an activity
     
     - parameter id: the activity id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ActivitiesLaps(id: Id, params: Params)
    
    /**
     Retrieves a club
     
     - parameter id: the club id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case Clubs(id: Id, params: Params)
    
    /**
     Lists announcments for a club
     
     - parameter id: the club id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ClubsAnnouncements(id: Id, params: Params)
    
    /**
     Lists events for a club
     
     - parameter id: the club id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ClubsEvents(id: Id, params: Params)
    
    /**
     Lists members of a club
     
     - parameter id: the club id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ClubsMembers(id: Id, params: Params)
    
    /**
     Lists activities by club members
     
     - parameter id: the club id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case ClubsActivities(id: Id, params: Params)
    
    /**
     Join a club (ie the current athlete)
     
     - parameter id: the club id
     **/
    case ClubsJoin(id: Id)
    
    /**
     Leave a club (ie the current athlete)
     
     - parameter id: the club id
     **/
    case ClubsLeave(id: Id)
    
    /**
     Retrieves a gear object
     
     - parameter id: the gear id
     **/
    case Gear(id: Id, params: Params)
    
    /**
     Retrieves a segment
     
     - parameter id: the segment id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case Segments(id: Id, params: Params)
    
    /**
     Lists segments the current athlete has starred
     
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case SegmentsStarred(params: Params)
    
    /**
     Lists efforts for a segment
     
     - parameter id: the segment id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case SegmentsEfforts(id: Id, params: Params)
    
    /**
     Lists the leaderboards for a segment
     
     - parameter id: the segment id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case SegmentsLeaderboards(id: Id, params: Params)
    
    /**
    Find popular segments within a given area.
     
     - parameter id: the segment id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case SegmentsExplore(id: Id, params: Params)
 
    /**
     Retrieve details about a specific segment effort. The effort must be public or it must correspond to the current athlete.
     
     - parameter id: the segment efforr id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case SegmentEfforts(id: Id, params: Params)

    /**
    Retrieves details about a route. Private routes can only be accessed if owned by the authenticating user and the token has view_private permissions. For raw data associated with a route see route streams.
     
     - parameter id: the route id
     **/
    case Routes(id: Id)
    
    /**
     Lists a specific athlete’s routes. Private routes will only be included if the authenticating user is viewing their own routes and the token has view_private permissions.
     
     - parameter id: the route id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case AthleteRoutes(id: Id, params: Params)
    
    /**
     Streams represent the raw data of the uploaded file. External applications may only access this information for activities owned by the authenticated athlete.
     
     - parameter id: the activity id
     - parameter types: single stream type or comma-separated list of types, if the activity does not have that stream it will not be included in the response
     **/
    case ActivityStreams(id: Id, types: String)
    
    /**
     A segment effort represents an attempt on a segment. This resource returns a subset of the activity streams that correspond to that effort.
     
     - parameter id: the effort id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case EffortStreams(id: Id, types: String)

    /**
     Retrieve segment streams
     
     Only distance, altitude and latlng stream types are available.
     
     - parameter id: the effort id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case SegmentStreams(id: Id, types: String)
    
    /**
     Retrieve route streams
     
     Distance, altitude and latlng stream types are always returned.
     
     - parameter id: the activity id
     **/
    case RouteStreams(id: Id)

    /**
     Upload an activity
     
     Requires write permissions, as requested during the authorization process.
     
     Posting a file for upload will enqueue it for processing. Initial checks will be done for malformed data and duplicates.     
     
     - parameter upload: an upload object
     **/
    case Upload(upload: StravaSwift.Upload)
    
    /**
     Check upload status
     
     Upon upload, Strava will respond with an upload ID. You may use this ID to poll the status of your upload. Strava recommends polling no more than once a second. Polling more frequently is unnecessary. The mean processing time is around 8 seconds.
    
     - parameter id: the upload id
     **/
    case Uploads(id: Id)


}

extension Router: URLRequestConvertible  {
    
    /**
      The Strava authorization url including the oauth query parameters
     **/
    static var authorizationUrl: NSURL {
        var url = "https://www.strava.com/oauth/authorize?"
        StravaClient.sharedInstance.authParams.forEach {
            url.appendContentsOf("\($0)=\($1)&")
        }
        return NSURL(string: url)!
    }
  
    /**
     The Url Request
    **/
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

extension Router {
    
    private var requestConfig: (path: String, params:[String: AnyObject]?, method: Alamofire.Method) {
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
            
        case .Athletes(let id, let params):
            return ("/athletes/\(id)", params, .GET)
        case .AthletesFriends(let id, let params):
            return ("/athletes/\(id)/friends", params, .GET)
        case .AthletesFollowers(let id, let params):
            return ("/athletes/\(id)/friends", params, .GET)
        case .AthletesBothFollowing(let id, let params):
            return ("/athletes/\(id)/both-following", params, .GET)
        case .AthletesStats(let id, let params):
            return ("/athletes/\(id)/stats", params, .GET)
        case .AthletesKoms(let id, let params):
            return ("/athletes/\(id)/koms", params, .GET)
            
        case .CreateActivity(let params):
            return ("/activities", params, .POST)
        case .UpdateActivity(let activity):
            return ("/activities/\(activity.id)", nil, .PUT)
        case .DeleteActivity(let activity):
            return ("/activities/\(activity.id)", nil, .DELETE)
            
        case .Activities(let id, let params):
            return ("/activities/\(id)", params, .GET)
        case .ActivitiesKudos(let id, let params):
            return ("/activities/\(id)/kudos", params, .GET)
        case .ActivitiesComments(let id, let params):
            return ("/activities/\(id)/comments", params, .GET)
        case .ActivitiesPhotos(let id, let params):
            return ("/activities/\(id)/photos/photo_sources=true", params, .GET)
        case .ActivitiesRelated(let id, let params):
            return ("/activities/\(id)/related", params, .GET)
        case .ActivitiesFriends(let id, let params):
            return ("/activities/\(id)/following", params, .GET)
        case .ActivitiesZones(let id, let params):
            return ("/activities/\(id)/zones", params, .GET)
        case .ActivitiesLaps(let id, let params):
            return ("/activities/\(id)/laps", params, .GET)
            
        case .Clubs(let id, let params):
            return ("/clubs/\(id)", params, .GET)
        case .ClubsAnnouncements(let id, let params):
            return ("/clubs/\(id)/announcements", params, .GET)
        case .ClubsEvents(let id, let params):
            return ("/clubs/\(id)/events", params, .GET)
        case ClubsMembers(let id, let params):
            return ("/clubs/\(id)/members", params, .GET)
        case ClubsActivities(let id, let params):
            return ("/clubs/\(id)/activities", params, .GET)
        case ClubsJoin(let id):
            return ("/clubs/\(id)/join", nil, .POST)
        case ClubsLeave(let id):
            return ("/clubs/\(id)/leave", nil, .POST)
            
        case .Segments(let id, let params):
            return ("/segments/\(id)", params, .GET)
        case SegmentsEfforts(let id, let params):
            return ("/segments/\(id)/efforts", params, .GET)
        case SegmentsLeaderboards(let id, let params):
            return ("/segments/\(id)/leaderboard", params, .GET)
        case SegmentsExplore(let id, let params):
            return ("/segments/\(id)/explore", params, .GET)
        case SegmentsStarred:
            return ("/segments/starred", nil, .GET)
            
        case SegmentEfforts(let id, let params):
            return ("/segment_efforts/\(id)", params, .GET)
            
        case Gear(let id, let params):
            return ("/gear/\(id)", params, .GET)
            
        case Routes(let id):
            return ("/routes/\(id)", nil, .GET)
        case AthleteRoutes(let id, let params):
            return ("/athletes/\(id)/routes", params, .GET)
            
        case ActivityStreams(let id, let type):
              return ("/activities/\(id)/streams/\(type)", nil, .GET)
        case EffortStreams(let id, let type):
            return ("/efforts/\(id)/streams/\(type)", nil, .GET)
        case SegmentStreams(let id, let type):
            return ("/segments/\(id)/streams/\(type)", nil, .GET)
        case RouteStreams(let id):
            return ("/routes/\(id)/streams", nil, .GET)
            
        case .Upload(let upload):
            return ("/uploads", upload.params, .POST)
        case .Uploads(let id):
            return ("/uploads", nil, .POST)
        }
    }
}

