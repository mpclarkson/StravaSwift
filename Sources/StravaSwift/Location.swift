// Location.swift
// Copyright (c) 2021 Copilot

import Foundation
import SwiftyJSON

/**
    Represents the latitude and longitude of a point
 **/
public struct Location: Strava, Hashable {
    public let lat: Double?
    public let lng: Double?

    /**
     Initializer (failable)

     - Parameter json: SwiftyJSON object
     - Internal
     **/
    public init(_ json: JSON) {
        let points = json.arrayValue
        lat = points.first?.double
        lng = points.last?.double
    }
}
