// Map.swift
// Copyright (c) 2021 Copilot

import Foundation
import SwiftyJSON

/**
  Represents a map of a ride or route
 **/
public struct Map: Strava, Hashable {
    public let id: String?
    public let resourceState: ResourceState?
    public let polyline: String?
    public let summaryPolyline: String?

    /**
     Initializer

     - Parameter json: SwiftyJSON object
     - Internal
     **/
    public init(_ json: JSON) {
        id = json["id"].string
        resourceState = json["resource_state"].strava(ResourceState.self)
        polyline = json["polyline"].string
        summaryPolyline = json["summary_polyline"].string
    }
}
