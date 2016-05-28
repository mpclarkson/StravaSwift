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
public final class Athlete: Strava, StravaProfile, StravaResourceState, StravaLocation {
    public var id: Int?
    public var resourceState: ResourceState?
    public var firstname: String?
    public var lastname: String?
    public var profileMedium: NSURL?
    public var profile: NSURL?
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
    
    /**
     Initializer
     
     - Parameter json: SwiftyJSON object
     - Internal
     **/
    required public init(_ json: JSON) {
        setProfile(json)
        setResourceState(json)
        setLocation(json)
        id = json["id"].int
        firstname = json["firstname"].string
        lastname = json["lastname"].string
        sex = json["sex"].strava(Sex)
        friend = json["friend"].strava(FollowingStatus)
        follower = json["follower"].strava(FollowingStatus)
        createdAt = json["created_at"].string?.toDate()
        updatedAt = json["updated_at"].string?.toDate()
        followerCount = json["follower_count"].int
        friendCount = json["friend_count"].int
        mutualFriendCount = json["mutual_friend_count"].int
        athleteType = json["athlete_type"].strava(AthleteType)
        datePreference = json["date_preference"].string
        measurementPreference = json["measurement_preference"].strava(Units)
        FTP = json["ftp"].int
        weight = json["weight"].double
        clubs = json["clubs"].strava(Club)
        bikes = json["bikes"].strava(Bike)
        shoes = json["shoes"].strava(Shoe)
    }
}
