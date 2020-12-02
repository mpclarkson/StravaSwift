//
//  Map.swift
//  StravaSwift
//
//  Created by Matthew on 24/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation

/**
  Represents a map of a ride or route
 **/
public struct Map: Decodable {
    public let id: String?
    public let resourceState: ResourceState?
    public let polyline: String?
    public let summaryPolyline: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case resourceState = "resource_state"
        case polyline
        case summaryPolyline = "summary_polyline"
    }
}
