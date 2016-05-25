//
//  Athelete.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 Athletes are Strava users, Strava users are athletes. The object is returned in detailed, summary or meta representations.
 **/
public class Athlete: Strava, StravaProfile, StravaResourceState, StravaLocation {
    
    public var id: Int?
    public var resourceState: ResourceState?
    public var firstname: String?
    public var lastname: String?
    
    //Profile
    public var profileMedium: NSURL?
    public var profile: NSURL?
    //Location
    public var city: String?
    public var state: String?
    public var country: String?
    
    public var sex: Sex?
    public var friend: FollowingStatus?
    public var follower: FollowingStatus?
    public var premium:Bool?
    public var createdAt: NSDate?
    public var updatedAt: NSDate?
    public var friendCount: Int?
    public var followerCount: Int?
    public var mutualFriendCount: Int?
    public var athleteType: AthleteType?
    public var datePreference: String?
    public var measurementPreference: Units?
    public var email: String?
    public var FTP: Int?
    public var weight: Double?
    
    public var clubs: [Club]?
    public var bikes: [Bike]?
    public var shoes: [Shoe]?
    
    required public init(_ json: JSON) {

        setProfile(json)
        setResourceState(json)
        setLocation(json)
    
        id = json["id"].int
        firstname = json["firstname"].string
        lastname = json["lastname"].string
        sex = Sex(optionalRawValue: json["sex"].string)
        friend = FollowingStatus(optionalRawValue: json["friend"].string)
        follower = FollowingStatus(optionalRawValue: json["follower"].string)
        createdAt = json["created_at"].string?.toDate()
        updatedAt = json["updated_at"].string?.toDate()
        followerCount = json["follower_count"].int
        friendCount = json["friend_count"].int
        mutualFriendCount = json["mutual_friend_count"].int
        athleteType = AthleteType(optionalRawValue: json["athlete_type"].int)
        datePreference = json["date_preference"].string
        measurementPreference = Units(optionalRawValue: json["measurement_preference"].string)
        FTP = json["ftp"].int
        weight = json["weight"].double
        clubs = json["clubs"].arrayValue.map  { Club($0) }
        bikes = json["bikes"].arrayValue.map  { Bike($0) }
        shoes = json["shoes"].arrayValue.map  { Shoe($0) }
    }
}
