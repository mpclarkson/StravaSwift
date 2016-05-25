//
//  Gear.swift
//  StravaSwift
//
//  Created by Matthew on 15/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 Gear represents equipment used during an activity. The object is returned in summary or detailed representations.

 **/
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

/**
 Shoe represents shoes worn on a run. The object is returned in summary or detailed representations.
 
 **/
public class Shoe: Gear {}

/**
 Bike represents a... bike!  The object is returned in summary or detailed representations.
 
 **/
public class Bike: Gear {
    public var frameType: FrameType?
    
    required public init(_ json: JSON) {
        super.init(json)
        
        frameType = FrameType(optionalRawValue: json["frame_type"].int)
    }
}

