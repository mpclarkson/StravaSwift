//
//  Split.swift
//  StravaSwift
//
//  Created by Matthew on 24/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation

/**
 Represents a summary of a split
 **/
public struct Split: Decodable {
    public let distance: Double?
    public let elapsedTime: Int?
    public let movingTime: Int?
    public let elevationDifference: Int?
    public let split: Int?

    enum CodingKeys: String, CodingKey {
        case distance
        case elapsedTime = "elapsed_time"
        case movingTime = "moving_time"
        case elevationDifference = "description"
        case split
    }
}
