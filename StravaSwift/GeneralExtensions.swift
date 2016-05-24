//
//  GeneralExtensions.swift
//  StravaSwift
//
//  Created by Matthew on 19/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation

extension RawRepresentable {
    init?(optionalRawValue rawValue: RawValue?) {
        guard let rawValue = rawValue, value = Self(rawValue: rawValue) else { return nil }
        self = value
    }
}

extension NSDateFormatter {
    func dateFromString(optional string: String?)  -> NSDate? {
        guard let string = string else { return nil }
        return dateFromString(string)
    }
}

extension NSURL {

    convenience init?(optionalString string: String?) {
        guard let string = string else { return nil }
        self.init(string: string)
    }
}

