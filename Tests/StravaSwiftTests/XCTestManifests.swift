// XCTestManifests.swift
// Copyright (c) 2021 Copilot

import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        [
            testCase(RouterTests.allTests),
        ]
    }
#endif
