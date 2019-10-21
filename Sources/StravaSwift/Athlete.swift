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
public final class Athlete: Strava {
    public let id: Int?
    public let resourceState: ResourceState?
    public let firstname: String?
    public let lastname: String?
    public let profileMedium: URL?
    public let profile: URL?
    public let city: String?
    public let state: String?
    public let country: String?
    public let sex: Sex?
    public let friend: FollowingStatus?
    public let follower: FollowingStatus?
    public let premium:Bool?
    public let createdAt: Date?
    public let updatedAt: Date?
    public let friendCount: Int?
    public let followerCount: Int?
    public let mutualFriendCount: Int?
    public let datePreference: String?
    public let measurementPreference: Units?
    public let email: String?
    public let FTP: Int?
    public let weight: Double?
    public let clubs: [Club]?
    public let bikes: [Bike]?
    public let shoes: [Shoe]?

    /**
     Initializer

     - Parameter json: SwiftyJSON object
     - Internal
     **/
    required public init(_ json: JSON) {
        id = json["id"].int
        resourceState = json["resource_state"].strava(ResourceState.self)
        city = json["city"].string
        state = json["state"].string
        country = json["country"].string
        profileMedium = URL(optionalString: json["profile_medium"].string)
        profile = URL(optionalString: json["profile"].string)
        firstname = json["firstname"].string
        lastname = json["lastname"].string
        sex = json["sex"].strava(Sex.self)
        friend = json["friend"].strava(FollowingStatus.self)
        follower = json["follower"].strava(FollowingStatus.self)
        premium = json["premium"].bool
        createdAt = json["created_at"].string?.toDate()
        updatedAt = json["updated_at"].string?.toDate()
        followerCount = json["follower_count"].int
        friendCount = json["friend_count"].int
        mutualFriendCount = json["mutual_friend_count"].int
        datePreference = json["date_preference"].string
        measurementPreference = json["measurement_preference"].strava(Units.self)
        email = json["email"].string
        FTP = json["ftp"].int
        weight = json["weight"].double
        clubs = json["clubs"].strava(Club.self)
        bikes = json["bikes"].strava(Bike.self)
        shoes = json["shoes"].strava(Shoe.self)
    }
}
