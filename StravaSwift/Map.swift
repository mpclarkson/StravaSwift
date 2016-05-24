//
//  Map.swift
//  StravaSwift
//
//  Created by Matthew on 24/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Map: Strava, StravaResourceState {
    public var id: String?
    public var resourceState: ResourceState?
    public var polyline: String?
    public var summaryPolyline: String?
    
    required public init(_ json: JSON) {
        setResourceState(json)
        id = json["id"].string
        polyline = json["polyline"].string
        summaryPolyline = json["summary_polyline"].string
    }
}
