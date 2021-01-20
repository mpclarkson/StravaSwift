// Comment.swift
// Copyright (c) 2021 Copilot

import Foundation
import SwiftyJSON

/**
 Comments on an activity can be viewed by any user. However, only internal applications are allowed to create or delete them.
 Comment posting can be enabled on a per application basis, email developers@strava.com for more information.
 **/
public struct Comment: Strava {
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
    public init(_ json: JSON) {
        id = json["id"].int
        resourceState = json["resource_state"].strava(ResourceState.self)
        activityId = json["activity_id"].int
        text = json["text"].string
        athlete = json["athlete"].strava(Athlete.self)
        createdAt = json["created_at"].string?.toDate()
    }
}
