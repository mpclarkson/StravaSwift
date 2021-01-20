// GearBikeShoe.swift
// Copyright (c) 2021 Copilot

import Foundation
import SwiftyJSON

public protocol Gearable: Strava, Codable {
    var id: String? { get set }
    var primary: Bool? { get set }
    var name: String? { get set }
    var description: String? { get set }
    var resourceState: ResourceState? { get set }
    var distance: Double? { get set }
    var brandName: String? { get set }
    var modelName: String? { get set }
}

/**
 Gear represents equipment used during an activity. The object is returned in summary or detailed representations.
 **/
public struct Gear: Strava, Gearable, Hashable {
    public var id: String?
    public var primary: Bool?
    public var name: String?
    public var description: String?
    public var resourceState: ResourceState?
    public var distance: Double?
    public var brandName: String?
    public var modelName: String?

    /**
     Initializer

     - Parameter json: SwiftyJSON object
     - Internal
     **/
    public init(_ json: JSON) {
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
public struct Shoe: Gearable, Equatable, Hashable {
    public var id: String?

    public var primary: Bool?

    public var name: String?

    public var description: String?

    public var resourceState: ResourceState?

    public var distance: Double?

    public var brandName: String?

    public var modelName: String?

    /**
     Initializer

     - Parameter json: SwiftyJSON object
     - Internal
     **/
    public init(_ json: JSON) {
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
 Bike represents a... bike!  The object is returned in summary or detailed representations.
 **/
public struct Bike: Gearable, Equatable, Hashable {
    public var id: String?

    public var primary: Bool?

    public var name: String?

    public var description: String?

    public var resourceState: ResourceState?

    public var distance: Double?

    public var brandName: String?

    public var modelName: String?

    public let frameType: FrameType?

    /**
     Initializer

     - Parameter json: SwiftyJSON object
     - Internal
     **/
    public init(_ json: JSON) {
        id = json["id"].string
        primary = json["primary"].bool
        name = json["name"].string
        description = json["description"].string
        resourceState = json["resource_state"].strava(ResourceState.self)
        distance = json["distance"].double
        brandName = json["brand_name"].string
        modelName = json["model_name"].string
        frameType = json["frame_type"].strava(FrameType.self)
    }
}
