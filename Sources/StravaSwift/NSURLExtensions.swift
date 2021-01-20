// NSURLExtensions.swift
// Copyright (c) 2021 Copilot

import Foundation

extension URL {
    func getQueryParameters() -> [String: String]? {
        var results = [String: String]()
        let keyValues = query?.components(separatedBy: "&")
        keyValues?.forEach {
            let kv = $0.components(separatedBy: "=")
            if kv.count > 1 {
                results[kv[0]] = kv[1]
            }
        }
        return results
    }
}
