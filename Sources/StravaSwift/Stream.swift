//
//  Stream.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation

/**
 Streams is the Strava term for the raw data associated with an activity. All streams for a given activity or segment effort will be the same length and the values at a given index correspond to the same time.
 **/
public struct Stream: Decodable {
    public let type: StreamType?
//    public let data: [Any]?
    public let seriesType: String?
    public let originalSize: Int?
    public let resolution: ResolutionType?

    
    enum CodingKeys: String, CodingKey {
        case type
//        case data
        case seriesType = "series_type"
        case originalSize = "original_size"
        case resolution
    }
}
