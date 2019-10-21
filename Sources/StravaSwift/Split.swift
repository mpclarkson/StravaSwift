//
//  Split.swift
//  StravaSwift
//
//  Created by Matthew on 24/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 Represents a summary of a split
 **/
public struct Split: Strava {
    public let distance: Double?
    public let elapsedTime: Int?
    public let movingTime: Int?
    public let elevationDifference: Int?
    public let split: Int?

    /**
     Initializer

     - Parameter json: SwiftyJSON object
     - Internal
     **/
    public init(_ json: JSON) {
        distance = json["distance"].double
        elapsedTime = json["elapsed_time"].int
        movingTime = json["moving_time"].int
        elevationDifference = json["elevation_difference"].int
        split = json["split"].int
    }

}
