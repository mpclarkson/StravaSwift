//
//  OAuthToken.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct OAuthToken: Strava {
    public var accessToken: String?
    public var athlete: Athlete?
    
    static private let key = "token"
    
    public init(_ json: JSON) {
        accessToken = json["access_token"].string
        athlete = Athlete(json["athlete"])
    }
}