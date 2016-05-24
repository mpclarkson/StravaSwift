//
//  Stream.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Stream: Strava {
    public var type: StreamType?
    public var data: [AnyObject]?
    public var seriesType: String?
    public var originalSize: Int?
    public var resolution: ResolutionType?
    
    required public init(_ json: JSON) {
        type = StreamType(optionalRawValue: json["type"].string)
        data = json["data"].arrayObject
        seriesType = json["series_type"].string
        originalSize = json["original_size"].int
        resolution  = ResolutionType(optionalRawValue: json["resolution"].string)
    }
}

