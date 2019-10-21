//
//  Comment.swift
//  StravaSwift
//
//  Created by Matthew on 24/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 Comments on an activity can be viewed by any user. However, only internal applications are allowed to create or delete them.
 Comment posting can be enabled on a per application basis, email developers@strava.com for more information.
 **/
public final class Comment: Strava {
    public let id: Int?
    public let resourceState: ResourceState?
    public let activityId: Int?
    public let text: String?
    public let athlete: Athlete?
    public let createdAt: Date?

    /**
     Initializer

     - Parameter json: SwiftyJSON object
     - Internal
     **/
    required public init(_ json: JSON) {
        id = json["id"].int
        resourceState = json["resource_state"].strava(ResourceState.self)
        activityId = json["activity_id"].int
        text = json["text"].string
        athlete = json["athlete"].strava(Athlete.self)
        createdAt = json["created_at"].string?.toDate()
    }
}
