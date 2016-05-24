//
//  Comment.swift
//  StravaSwift
//
//  Created by Matthew on 24/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Comment: Strava, StravaResourceState {
    public var id: Int?
    public var resourceState: ResourceState?
    public var activityId: Int?
    public var text: String?
    public var athlete: Athlete?
    public var createdAt: NSDate?
    
    required public init(_ json: JSON) {
        id = json["id"].int
        setResourceState(json)
        activityId = json["activity_id"].int
        text = json["text"].string
        athlete = Athlete(json["athlete"])
        createdAt = json["created_at"].string?.toDate()
        
    }
}