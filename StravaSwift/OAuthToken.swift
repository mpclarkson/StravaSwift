//
//  OAuthToken.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 oAuth token which is required for request Strava resources
 
 - parameter json: A SwiftyJSON object
 **/
public struct OAuthToken: Strava {
    public let accessToken: String?
    public let athlete: Athlete?

    public init(_ json: JSON) {
        accessToken = json["access_token"].string
        athlete = Athlete(json["athlete"])
    }
}