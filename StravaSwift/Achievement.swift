//
//  Achievement.swift
//  StravaSwift
//
//  Created by Matthew on 24/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Achievement: Strava {
    public var type: AchievementType?
    public var rank: Int?
    
    required public init(_ json: JSON) {
        type = AchievementType(optionalRawValue: json["type"].string)
        rank = json["rank"].int
    }
}