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
public class Comment: Strava, StravaResourceState {
    public var id: Int?
    public var resourceState: ResourceState?
    public var activityId: Int?
    public var text: String?
    public var athlete: Athlete?
    public var createdAt: NSDate?
    
    /**
     Initializer
     
     - Parameter json: SwiftyJSON object
     - Internal
     **/
    required public init(_ json: JSON) {
        id = json["id"].int
        setResourceState(json)
        activityId = json["activity_id"].int
        text = json["text"].string
        athlete = Athlete(json["athlete"])
        createdAt = json["created_at"].string?.toDate()
        
    }
}