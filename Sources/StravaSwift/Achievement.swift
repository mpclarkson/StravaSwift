//
//  Achievement.swift
//  StravaSwift
//
//  Created by Matthew on 24/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation

/**
   Achievement struct - details the type of achievement and the rank
 **/
public struct Achievement: Decodable {
    /** Achievement type enum **/
    public let type: AchievementType?

    /** Rank for the achievement **/
    public let rank: Int?
}
