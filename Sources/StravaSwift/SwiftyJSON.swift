// SwiftyJSON.swift
// Copyright (c) 2021 Copilot

import SwiftyJSON

extension RawRepresentable {
    init?(o rawValue: RawValue?) {
        guard let rawValue = rawValue, let value = Self(rawValue: rawValue) else { return nil }
        self = value
    }
}

public extension JSON {
    func strava<T: Strava>(_ type: T.Type?) -> T? {
        type?.init(self)
    }

    func strava<T: RawRepresentable>(_ type: T.Type?) -> T? where T.RawValue == Int {
        type?.init(optionalRawValue: int)
    }

    func strava<T: RawRepresentable>(_ type: T.Type?) -> T? where T.RawValue == String {
        type?.init(optionalRawValue: string)
    }

    func strava<T: Strava>(_: T.Type?) -> [T]? {
        arrayValue.compactMap { T($0) }
    }
}
