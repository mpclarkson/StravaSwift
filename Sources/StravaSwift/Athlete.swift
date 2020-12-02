//
//  Athelete.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
/**
  Athletes are Strava users, Strava users are athletes. The object is returned in detailed, summary or meta representations.
 **/
public struct Athlete: Decodable {
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
    //public let createdAt: Date?
    //public let updatedAt: Date?
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

    enum CodingKeys: String, CodingKey {
        case id
        case resourceState = "resource_state"
        case city
        case state
        case country
        case profileMedium = "profile_medium"
        case profile
        case firstname
        case lastname
        case sex
        case friend
        case follower
        case premium
        //case createdAt = "created_at"
        //case updatedAt = "updated_at"
        case followerCount = "follower_count"
        case friendCount = "friend_count"
        case mutualFriendCount = "mutual_friend_count"
        case datePreference = "date_preference"
        case measurementPreference = "measurement_preference"
        case email
        case FTP = "ftp"
        case weight
        case clubs
        case bikes
        case shoes
    }
}
