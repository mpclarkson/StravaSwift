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
open class Gear: Strava {
    public let id: String?
    public let primary: Bool?
    public let name: String?
    public let description: String?
    public let resourceState: ResourceState?
    public let distance: Double?
    public let brandName: String?
    public let modelName: String?

    /**
     Initializer
     
     - Parameter json: SwiftyJSON object
     - Internal
     **/
    required public init(_ json: JSON) {
        id = json["id"].string
        primary = json["primary"].bool
        name = json["name"].string
        description = json["description"].string
        resourceState = json["resource_state"].strava(ResourceState.self)
        distance = json["distance"].double
        brandName = json["brand_name"].string
        modelName = json["model_name"].string
    }
}

/**
  Shoe represents shoes worn on a run. The object is returned in summary or detailed representations.
 **/
public final class Shoe: Gear {}

/**
 Bike represents a... bike!  The object is returned in summary or detailed representations.
 **/
public final class Bike: Gear {
    public let frameType: FrameType?
    
    /**
     Initializer
     
     - Parameter json: SwiftyJSON object
     - Internal
     **/
    required public init(_ json: JSON) {
        frameType = json["frame_type"].strava(FrameType.self)
        super.init(json)
    }
}

