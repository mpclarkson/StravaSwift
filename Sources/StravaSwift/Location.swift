//
//  Location.swift
//  StravaSwift
//
//  Created by MATTHEW CLARKSON on 23/05/2016.
//  Copyright © 2016 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
    Represents the latitude and longitude of a point
 **/
public struct Location: Strava {
    public let lat: Double?
    public let lng: Double?

    /**
     Initializer (failable)

     - Parameter json: SwiftyJSON object
     - Internal
     **/
    public init(_ json: JSON) {
        let points = json.arrayValue
        self.lat = points.first?.double
        self.lng = points.last?.double
    }
}
