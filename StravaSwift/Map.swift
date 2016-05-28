//
//  Map.swift
//  StravaSwift
//
//  Created by Matthew on 24/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
  Represents a map of a ride or route
 **/
public final class Map: Strava, StravaResourceState {
    public var id: String?
    public var resourceState: ResourceState?
    public var polyline: String?
    public var summaryPolyline: String?
    
    /**
     Initializer
     
     - Parameter json: SwiftyJSON object
     - Internal
     **/
    required public init(_ json: JSON) {
        setResourceState(json)
        id = json["id"].string
        polyline = json["polyline"].string
        summaryPolyline = json["summary_polyline"].string
    }
}
