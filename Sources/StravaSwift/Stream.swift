//
//  Stream.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 Streams is the Strava term for the raw data associated with an activity. All streams for a given activity or segment effort will be the same length and the values at a given index correspond to the same time.
 **/
public struct Stream: Strava {
    public let type: StreamType?
    public let data: [Any]?
    public let seriesType: String?
    public let originalSize: Int?
    public let resolution: ResolutionType?

    /**
     Initializer

     - Parameter json: SwiftyJSON object
     - Internal
     **/
    public init(_ json: JSON) {
        type = json["type"].strava(StreamType.self)
        data = json["data"].arrayObject
        seriesType = json["series_type"].string
        originalSize = json["original_size"].int
        resolution  = json["resolution"].strava(ResolutionType.self)
    }
}
