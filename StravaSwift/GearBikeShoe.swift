//
//  Gear.swift
//  StravaSwift
//
//  Created by Matthew on 15/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Gear: Strava, StravaResourceState, StravaDescription {
    public var id: String?
    public var primary: Bool?
    public var name: String?
    public var description: String?
    public var resourceState: ResourceState?
    public var distance: Double?
    public var brandName: String?
    public var modelName: String?

    required public init(_ json: JSON) {
        setResourceState(json)
        setDescription(json)
        id = json["id"].string
        primary = json["primary"].bool
        distance = json["distance"].double
        brandName = json["brand_name"].string
        modelName = json["model_name"].string
    }
}

public class Shoe: Gear {}

public class Bike: Gear {
    public var frameType: FrameType?
    
    required public init(_ json: JSON) {
        super.init(json)
        
        frameType = FrameType(optionalRawValue: json["frame_type"].int)
    }
}

