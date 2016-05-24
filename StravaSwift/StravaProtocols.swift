//
//  StravaProtocols.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

public protocol Strava: CustomStringConvertible {
    init(_ json: JSON)
}

extension Strava {
    public var description: String {
        let mirror = Mirror(reflecting: self)
        var desc: String = ""
        for child in mirror.children {
            desc += "\(child.label!): \(child.value) \n"
        }
        
        return desc
    }
}

public protocol StravaProfile: class {
    var profileMedium: NSURL? { get set }
    var profile: NSURL? { get set }
}

public extension StravaProfile {
    func setProfile(json: JSON) {
        profileMedium = NSURL(optionalString: json["profile_medium"].string)
        profile = NSURL(optionalString: json["profile"].string)
    }
}

public protocol StravaResourceState: class {
    var resourceState:ResourceState? { get set }
}

public extension StravaResourceState {
    func setResourceState(json: JSON) {
        resourceState = ResourceState(optionalRawValue: json["resource_state"].int)
    }
}

public protocol StravaDescription: class {
    var name: String? { get set }
    var description: String? { get set }
}

public extension StravaDescription {
    func setDescription(json: JSON) {
        name = json["name"].string
        description = json["description"].string
    }
}

public protocol StravaLocation: class {
    var city: String? { get set }
    var state: String? { get set }
    var country: String? { get set }
}

public extension StravaLocation {
    func setLocation(json: JSON) {
        city = json["city"].string
        state = json["state"].string
        country = json["country"].string
    }
}



