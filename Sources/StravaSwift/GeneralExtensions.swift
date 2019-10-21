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
        guard let rawValue = rawValue, let value = Self(rawValue: rawValue) else { return nil }
        self = value
    }
}

extension DateFormatter {
    func dateFromString(optional string: String?)  -> Date? {
        guard let string = string else { return nil }
        return date(from: string)
    }
}

extension URL {
    init?(optionalString string: String?) {
        guard let string = string else { return nil }
        self.init(string: string)
    }
}
