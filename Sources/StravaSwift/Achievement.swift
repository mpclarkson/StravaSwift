//
//  Achievement.swift
//  StravaSwift
//
//  Created by Matthew on 24/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
   Achievement struct - details the type of achievement and the rank
 **/
public struct Achievement: Strava {
    /** Achievement type enum **/
    public let type: AchievementType?

    /** Rank for the achievement **/
    public let rank: Int?

    /**
     Initializer

     - Parameter json: SwiftyJSON object
     - Internal
     **/
    public init(_ json: JSON) {
        type = json["type"].strava(AchievementType.self)
        rank = json["rank"].int
    }
}
