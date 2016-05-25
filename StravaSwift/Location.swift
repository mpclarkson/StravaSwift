//
//  Location.swift
//  StravaSwift
//
//  Created by MATTHEW CLARKSON on 23/05/2016.
//  Copyright © 2016 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
    Represents the latitude and longitude of a point
 **/
public struct Location {
    let lat: Double
    let lng: Double
    
    init?(_ points: [JSON]?) {
        guard let lat = points?.first?.double, lng = points?[1].double else { return nil }
        self.lat = lat
        self.lng = lng
    }
}