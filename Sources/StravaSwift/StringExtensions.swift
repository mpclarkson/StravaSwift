// StringExtensions.swift
// Copyright (c) 2021 Copilot

import Foundation

extension String {
    func toDate(_ format: String = "yyyy-MM-dd'T'HH:mm:ssZZZZZ") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
}
