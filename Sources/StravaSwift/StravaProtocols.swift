// StravaProtocols.swift
// Copyright (c) 2021 Copilot

import Foundation
import SwiftyJSON

/**
  Base protocol for Strava resources

  - Internal
 **/
public protocol Strava: CustomStringConvertible, Equatable {
    init(_ json: JSON)
}

public extension Strava {
    var description: String {
        let mirror = Mirror(reflecting: self)
        var desc = ""
        for child in mirror.children {
            desc += "\(child.label!): \(child.value) \n"
        }
        return desc
    }
}
