// StravaClientError.swift
// Copyright (c) 2021 Copilot

import Foundation

/**
 StravaClientError Enum
 */
public enum StravaClientError: Error {
    /**
      The OAuthCredentials are invalid
     **/
    case invalidCredentials

    /**
      Uknown error
     **/
    case unknown
}
