//
//  Club.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 Clubs represent groups of athletes on Strava. They can be public or private. The object is returned in summary or detailed representations.
 **/
public class Club: Strava, StravaProfile, StravaResourceState, StravaDescription, StravaLocation {
    
    public var id: Int?
    //Profile
    public var profileMedium: NSURL?
    public var profile: NSURL?
    //Description
    public var name: String?
    public var description: String?
    //Location
    public var city: String?
    public var state: String?
    public var country: String?
    
    public var clubType: ClubType?
    public var sportType: SportType?
    public var isPrivate: Bool?
    public var memberCount: Int?
    
    public var resourceState: ResourceState?
    
    required public init(_ json: JSON) {
        id = json["id"].int
        setProfile(json)
        setResourceState(json)
        setDescription(json)
        isPrivate = json["private"].bool
        memberCount = json["member_count"].int
    }
}