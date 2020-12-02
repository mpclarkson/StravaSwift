//
//  Gear.swift
//  StravaSwift
//
//  Created by Matthew on 15/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation

/**
 Gear represents equipment used during an activity. The object is returned in summary or detailed representations.
 **/
protocol GearProvider {
    var id: String? { get set }
    var primary: Bool? { get set }
    var name: String? { get set }
    var description: String? { get set }
    var resourceState: ResourceState? { get set }
    var distance: Double? { get set }
    var brandName: String? { get set }
    var modelName: String? { get set }
}

public struct Gear: GearProvider, Decodable {
    public var id: String?
    public var primary: Bool?
    public var name: String?
    public var description: String?
    public var resourceState: ResourceState?
    public var distance: Double?
    public var brandName: String?
    public var modelName: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case primary
        case name
        case description
        case resourceState = "resource_state"
        case brandName = "brand_name"
        case modelName = "model_name"
        case distance
    }
}

/**
  Shoe represents shoes worn on a run. The object is returned in summary or detailed representations.
 **/
public struct Shoe: GearProvider, Decodable {
    public var id: String?
    public var primary: Bool?
    public var name: String?
    public var description: String?
    public var resourceState: ResourceState?
    public var distance: Double?
    public var brandName: String?
    public var modelName: String?

    enum CodingKeys: String, CodingKey {
        case id
        case primary
        case name
        case description
        case resourceState = "resource_state"
        case brandName = "brand_name"
        case modelName = "model_name"
        case distance
    }
}

/**
 Bike represents a... bike!  The object is returned in summary or detailed representations.
 **/
public struct Bike: GearProvider, Decodable {
    public var id: String?
    public var primary: Bool?
    public var name: String?
    public var description: String?
    public var resourceState: ResourceState?
    public var distance: Double?
    public var brandName: String?
    public var modelName: String?
    public let frameType: FrameType?
    
    enum CodingKeys: String, CodingKey {
        case id
        case primary
        case name
        case description
        case resourceState = "resource_state"
        case brandName = "brand_name"
        case modelName = "model_name"
        case distance
        case frameType = "frame_type"
    }
}
