//
//  StravaClientError.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

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
