//
//  StravaClientError.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation

/** StravaClientError Enum

*/
public enum StravaClientError: ErrorType {
    case
    NoClientId,
    NoClientSecret,
    NoRedirectURL,
    NoUsername,
    NoPassword,
    NoCredentials,
    NoCode,
    Unknown
}
