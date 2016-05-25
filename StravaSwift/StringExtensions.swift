//
//  StringExtensions.swift
//  StravaSwift
//
//  Created by MATTHEW CLARKSON on 23/05/2016.
//  Copyright © 2016 Matthew Clarkson. All rights reserved.
//

import Foundation

extension String {
    func toDate(format: String = "yyyy-MM-dd'T'HH:mm:ssZZZZZ") -> NSDate? {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.dateFromString(self)
    }
}