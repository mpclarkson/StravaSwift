// Stream.swift
// Copyright (c) 2021 Copilot

import Foundation
import SwiftyJSON

/**
 Streams is the Strava term for the raw data associated with an activity. All streams for a given activity or segment effort will be the same length and the values at a given index correspond to the same time.
 **/
public struct Stream: Strava {
    public let type: StreamType?
    public let data: Data?
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
        data = try? json["data"].rawData()
        seriesType = json["series_type"].string
        originalSize = json["original_size"].int
        resolution = json["resolution"].strava(ResolutionType.self)
    }
}
