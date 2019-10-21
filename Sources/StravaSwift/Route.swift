//
//  Route.swift
//  Pods
//
//  Created by MATTHEW CLARKSON on 25/05/2016.
//
//

import SwiftyJSON

/**
 Routes are manually-created paths made up of sections called legs.
 **/
public final class Route: Strava {
    public let id: Int?
    public let resourceState: ResourceState?
    public let name: String?
    public let description: String?
    public let athlete: Athlete?
    public let distance: Double?
    public let elevationGain: Double?
    public let map: Map?
    public let type: RouteType?
    public let subType: RouteSubType?
    public let `private`: Bool?
    public let starred: Bool?
    public let timeStamp: Int?
    public let segments: [Segment]?

    /**
     Initializer

     - Parameter json: SwiftyJSON object
     - Internal
     **/
    required public init(_ json: JSON) {
        id = json["id"].int
        resourceState = json["resource_state"].strava(ResourceState.self)
        name = json["name"].string
        description = json["description"].string
        athlete = json["athlete"].strava(Athlete.self)
        distance = json["distance"].double
        elevationGain = json["elevation_gain"].double
        map = json["map"].strava(Map.self)
        type = json["type"].strava(RouteType.self)
        subType = json["sub_type"].strava(RouteSubType.self)
        `private` = json["private"].bool
        starred = json["starred"].bool
        timeStamp = json["time_stamp"].int
        segments = json["segments"].strava(Segment.self)
    }
}
