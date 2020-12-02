//
//  Comment.swift
//  StravaSwift
//
//  Created by Matthew on 24/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation

/**
 Comments on an activity can be viewed by any user. However, only internal applications are allowed to create or delete them.
 Comment posting can be enabled on a per application basis, email developers@strava.com for more information.
 **/
public struct Comment: Decodable {
    public let id: Int?
    public let resourceState: ResourceState?
    public let activityId: Int?
    public let text: String?
    public let athlete: Athlete?
    public let createdAt: Date?
    
    enum CodingKeys: String, CodingKey {
        case id
        case resourceState = "resource_state"
        case activityId = "activity_id"
        case text
        case athlete
        case createdAt
    }
}
