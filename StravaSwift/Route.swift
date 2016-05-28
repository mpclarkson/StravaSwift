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
 
 - Warning: Not yet implmented
 **/
public final class Route: Strava, StravaResourceState {
    public var id: Int?
    public var resourceState: ResourceState?
    public var name: String?
    public var description: String?
    public var athlete: Athlete?
    public var distance: Double?
    public var elevationGain: Double?
    public var map: Map?
    public var type: RouteType?
    public var subType: RouteSubType?
    public var `private`: Bool?
    public var starred: Bool?
    public var timeStamp: Int?
    public var segments: [Segment]?
      
    /**
     Initializer
     
     - Parameter json: SwiftyJSON object
     - Internal
     **/
    required public init(_ json: JSON) {
        id = json["id"].int
        name = json["name"].string
        description = json["description"].string
        athlete = Athlete(json["athlete"])
        distance = json["distance"].double
        elevationGain = json["elevation_gain"].double
        map = Map(json["map"])
        type = RouteType(optionalRawValue: json["type"].int)
        subType = RouteSubType(optionalRawValue: json["sub_type"].int)
        `private` = json["private"].bool
        starred = json["starred"].bool
        timeStamp = json["time_stamp"].int
        segments = json["segments"].array?.flatMap { Segment($0) }
        setResourceState(json)
    }
}