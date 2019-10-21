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
    public typealias Params = [String: Any]?

    /**
     Requests a Strava OAuth token

     - parameter code: the code returned from Strava after granting access to the application
     **/
    case token(code: String)

    /**
     Requests a Strava OAuth token refresh

     - parameter refresh: the refresh token returned from Strava after granting access to the application
     **/
    case refresh(refreshToken: String)

    /**
     Allows an application to revoke its access to an athlete’s data. This will invalidate all access tokens associated with the ‘athlete,application’ pair used to create the token. The application will be removed from the Athlete Settings page on Strava. All requests made using invalidated tokens will receive a 401 Unauthorized response.

     - parameter token: the access token to deauthorize
     **/
    case deauthorize(accessToken: String)

    /**
     Gets the current user/athlete
     **/
    case athlete

    /**
     Updates the current user/athlete
     **/
    case updateAthlete

    /**
     Lists the current user/athlete's activities

     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case athleteActivities(params: Params)

    /**
     Lists the current user/athlete's friends

     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case athleteFriends(params: Params)

    /**
     Lists the current user/athlete's followers

     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case athleteFollowers(params: Params)

    /**
     Lists the current user/athlete's clubs

     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case athleteClubs(params: Params)

    /**
     Gets a specific athlete

     - parameter id: the athlete id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case athletes(id: Id, params: Params)

    /**
     Lists a specific athlete's friends

     - parameter id: the athlete id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case athletesFriends(id: Id, params: Params)

    /**
     Lists a specific athlete's followers

     - parameter id: the athlete id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case athletesFollowers(id: Id, params: Params)

    /**
     Lists athletes the current user and the requested athlete are both following

     - parameter id: the athlete id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case athletesBothFollowing(id: Id, params: Params)

    /**
     Gets the statistics for a specific athlete

     - parameter id: the athlete id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case athletesStats(id: Id, params: Params)

    /**
     Lists the specific athlete's KOMS

     - parameter id: the athlete id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case athletesKoms(id: Id, params: Params)

    /**
     Creates a new manual activity in Strava for the athlete (not for uploading files)

     - parameter params: a [String: String] dictionary representing the activity
     **/
    case createActivity(params: Params)

    /**
     Updates an activity, requires write permissions
     - parameter activity: an Activity object
     **/
    case updateActivity(activity: Activity)

    /**
     Deletes an activity, requires write permissions

     - parameter activity: an Activity object
     **/
    case deleteActivity(activity: Activity)

    /**
     Gets an activity

     - parameter id: the activity id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case activities(id: Id, params: Params)

    /**
     Lists kudos for an activity

     - parameter id: the activity id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case activitiesKudos(id: Id, params: Params)

    /**
     Lists comments for an activity

     - parameter id: the activity id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case activitiesComments(id: Id, params: Params)

    /**
     Lists photos for an activity

     - parameter id: the activity id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case activitiesPhotos(id: Id, params: Params)

    /**
     Lists related activities

     - parameter id: the activity id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case activitiesRelated(id: Id, params: Params)

    /**
     List the recent activities performed by the current athlete and those they are following. Pagination is supported. However, results are limited to the last 200 total activities.

     - parameter id: the activity id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case activitiesFriends(id: Id, params: Params)

    /**
     Heartrate and power zones are set by the athlete. This endpoint returns the time (seconds) in each zone. The distribution is not customizable. Requires an access token associated with the owner of the activity and the owner must be a premium user.

     - parameter id: the activity id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case activitiesZones(id: Id, params: Params)

    /**
     Lists all laps associated with an activity

     - parameter id: the activity id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case activitiesLaps(id: Id, params: Params)

    /**
     Retrieves a club

     - parameter id: the club id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case clubs(id: Id, params: Params)

    /**
     Lists announcments for a club

     - parameter id: the club id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case clubsAnnouncements(id: Id, params: Params)

    /**
     Lists events for a club

     - parameter id: the club id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case clubsEvents(id: Id, params: Params)

    /**
     Lists members of a club

     - parameter id: the club id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case clubsMembers(id: Id, params: Params)

    /**
     Lists activities by club members

     - parameter id: the club id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case clubsActivities(id: Id, params: Params)

    /**
     Join a club (ie the current athlete)

     - parameter id: the club id
     **/
    case clubsJoin(id: Id)

    /**
     Leave a club (ie the current athlete)

     - parameter id: the club id
     **/
    case clubsLeave(id: Id)

    /**
     Retrieves a gear object

     - parameter id: the gear id
     **/
    case gear(id: Id, params: Params)

    /**
     Retrieves a segment

     - parameter id: the segment id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case segments(id: Id, params: Params)

    /**
     Lists segments the current athlete has starred

     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case segmentsStarred(params: Params)

    /**
     Lists efforts for a segment

     - parameter id: the segment id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case segmentsEfforts(id: Id, params: Params)

    /**
     Lists the leaderboards for a segment

     - parameter id: the segment id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case segmentsLeaderboards(id: Id, params: Params)

    /**
    Find popular segments within a given area.

     - parameter id: the segment id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case segmentsExplore(id: Id, params: Params)

    /**
     Retrieve details about a specific segment effort. The effort must be public or it must correspond to the current athlete.

     - parameter id: the segment efforr id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case segmentEfforts(id: Id, params: Params)

    /**
    Retrieves details about a route. Private routes can only be accessed if owned by the authenticating user and the token has view_private permissions. For raw data associated with a route see route streams.

     - parameter id: the route id
     **/
    case routes(id: Id)

    /**
     Lists a specific athlete’s routes. Private routes will only be included if the authenticating user is viewing their own routes and the token has view_private permissions.

     - parameter id: the route id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case athleteRoutes(id: Id, params: Params)

    /**
     Streams represent the raw data of the uploaded file. External applications may only access this information for activities owned by the authenticated athlete.

     - parameter id: the activity id
     - parameter types: single stream type or comma-separated list of types, if the activity does not have that stream it will not be included in the response
     **/
    case activityStreams(id: Id, types: String)

    /**
     A segment effort represents an attempt on a segment. This resource returns a subset of the activity streams that correspond to that effort.

     - parameter id: the effort id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case effortStreams(id: Id, types: String)

    /**
     Retrieve segment streams

     Only distance, altitude and latlng stream types are available.

     - parameter id: the effort id
     - parameter params: a [String: String] dictionary of acceptable parameters
     **/
    case segmentStreams(id: Id, types: String)

    /**
     Retrieve route streams

     Distance, altitude and latlng stream types are always returned.

     - parameter id: the activity id
     **/
    case routeStreams(id: Id)

//    /**
//     Upload an activity
//
//     Requires write permissions, as requested during the authorization process.
//
//     Posting a file for upload will enqueue it for processing. Initial checks will be done for malformed data and duplicates.
//
//     - parameter upload: an upload object
//     **/
    case uploadFile(upload: StravaSwift.UploadData)
//
//    /**
//     Check upload status
//
//     Upon upload, Strava will respond with an upload ID. You may use this ID to poll the status of your upload. Strava recommends polling no more than once a second. Polling more frequently is unnecessary. The mean processing time is around 8 seconds.
//
//     - parameter id: the upload id
//     **/
//    case uploads(id: Id)
//

}

extension Router: URLRequestConvertible  {

    /**
     The Strava app authorization deeplink url including the oauth query parameters
    **/
    static var appAuthorizationUrl: URL {
        let baseUrl = "strava://oauth/mobile/authorize"
        let authParams = StravaClient.sharedInstance.authParams
            .map { "\($0.key)=\($0.value)" }
            .joined(separator:"&")
        return URL(string: "\(baseUrl)?\(authParams)")!
    }

    /**
      The Strava web authorization url including the oauth query parameters
     **/
    static var webAuthorizationUrl: URL {
        let baseUrl = "https://www.strava.com/oauth/authorize"
        let authParams = StravaClient.sharedInstance.authParams
            .map { "\($0.key)=\($0.value)" }
            .joined(separator:"&")
        return URL(string: "\(baseUrl)?\(authParams)")!
    }

    /**
     The Url Request
    **/
    public func asURLRequest () throws -> URLRequest {
        let config = self.requestConfig

        var baseURL: URL {
            switch self {
            case .token, .deauthorize, .refresh:
                return URL(string: "https://www.strava.com/oauth")!
            default:
                return URL(string: "https://www.strava.com/api/v3")!
            }
        }

        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(config.path))
        urlRequest.httpMethod = config.method.rawValue

        if let token = StravaClient.sharedInstance.token?.accessToken {
            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        if let params = config.params, params.count > 0 {
            switch config.method {
                case .get:
                    var urlComponents = URLComponents(url: urlRequest.url!, resolvingAgainstBaseURL: false)!
                    urlComponents.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)")}
                    urlRequest.url = urlComponents.url!
                    return urlRequest
                default:
                    return try JSONEncoding.default.encode(urlRequest, with: params)
            }
        } else {
            return try JSONEncoding.default.encode(urlRequest)
        }
    }
}

extension Router {

    fileprivate var requestConfig: (path: String, params: Params, method: Alamofire.HTTPMethod) {
        switch self {

        case .token(let code):
            return ("/token", StravaClient.sharedInstance.tokenParams(code), .post)
        case .refresh(let refreshToken):
            return ("/token", StravaClient.sharedInstance.refreshParams(refreshToken), .post)
        case .deauthorize(let token):
            let params = ["access_token" : token]
            return ("/deauthorize", params, .post)

        case .athlete:
            return ("/athlete", nil, .get)
        case .updateAthlete:
            return ("/athlete", nil, .put)
        case .athleteFriends(let params):
            return ("/athlete/friends", params, .get)
        case .athleteFollowers(let params):
            return ("/athlete/followers", params, .get)
        case .athleteClubs(let params):
            return ("/athlete/clubs", params, .get)
        case .athleteActivities(let params):
            return ("/athlete/activities", params, .get)

        case .athletes(let id, let params):
            return ("/athletes/\(id)", params, .get)
        case .athletesFriends(let id, let params):
            return ("/athletes/\(id)/friends", params, .get)
        case .athletesFollowers(let id, let params):
            return ("/athletes/\(id)/friends", params, .get)
        case .athletesBothFollowing(let id, let params):
            return ("/athletes/\(id)/both-following", params, .get)
        case .athletesStats(let id, let params):
            return ("/athletes/\(id)/stats", params, .get)
        case .athletesKoms(let id, let params):
            return ("/athletes/\(id)/koms", params, .get)

        case .createActivity(let params):
            return ("/activities", params, .post)
        case .updateActivity(let activity):
            return ("/activities/\(activity.id!)", nil, .put)
        case .deleteActivity(let activity):
            return ("/activities/\(activity.id!)", nil, .delete)

        case .activities(let id, let params):
            return ("/activities/\(id)", params, .get)
        case .activitiesKudos(let id, let params):
            return ("/activities/\(id)/kudos", params, .get)
        case .activitiesComments(let id, let params):
            return ("/activities/\(id)/comments", params, .get)
        case .activitiesPhotos(let id, let params):
            return ("/activities/\(id)/photos/photo_sources=true", params, .get)
        case .activitiesRelated(let id, let params):
            return ("/activities/\(id)/related", params, .get)
        case .activitiesFriends(let id, let params):
            return ("/activities/\(id)/following", params, .get)
        case .activitiesZones(let id, let params):
            return ("/activities/\(id)/zones", params, .get)
        case .activitiesLaps(let id, let params):
            return ("/activities/\(id)/laps", params, .get)

        case .clubs(let id, let params):
            return ("/clubs/\(id)", params, .get)
        case .clubsAnnouncements(let id, let params):
            return ("/clubs/\(id)/announcements", params, .get)
        case .clubsEvents(let id, let params):
            return ("/clubs/\(id)/events", params, .get)
        case .clubsMembers(let id, let params):
            return ("/clubs/\(id)/members", params, .get)
        case .clubsActivities(let id, let params):
            return ("/clubs/\(id)/activities", params, .get)
        case .clubsJoin(let id):
            return ("/clubs/\(id)/join", nil, .post)
        case .clubsLeave(let id):
            return ("/clubs/\(id)/leave", nil, .post)

        case .segments(let id, let params):
            return ("/segments/\(id)", params, .get)
        case .segmentsEfforts(let id, let params):
            return ("/segments/\(id)/all_efforts", params, .get)
        case .segmentsLeaderboards(let id, let params):
            return ("/segments/\(id)/leaderboard", params, .get)
        case .segmentsExplore(let id, let params):
            return ("/segments/\(id)/explore", params, .get)
        case .segmentsStarred:
            return ("/segments/starred", nil, .get)
        case .segmentEfforts(let id, let params):
            return ("/segment_efforts/\(id)", params, .get)

        case .gear(let id, let params):
            return ("/gear/\(id)", params, .get)

        case .routes(let id):
            return ("/routes/\(id)", nil, .get)
        case .athleteRoutes(let id, let params):
            return ("/athletes/\(id)/routes", params, .get)

        case .activityStreams(let id, let type):
              return ("/activities/\(id)/streams/\(type)", nil, .get)
        case .effortStreams(let id, let type):
            return ("/segment_efforts/\(id)/streams/\(type)", nil, .get)
        case .segmentStreams(let id, let type):
            return ("/segments/\(id)/streams/\(type)", nil, .get)
        case .routeStreams(let id):
            return ("/routes/\(id)/streams", nil, .get)

        case .uploadFile(let upload):
            return ("/uploads", upload.params, .post)
//        case .uploads(let id):
//            return ("/uploads/\(id)", nil, .post)
        }
    }
}
