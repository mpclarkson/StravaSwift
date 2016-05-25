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
public enum StravaClientError: ErrorType {
    case
    /**
     The OAuthCredentials are invalid
    **/
    InvalidCredentials,
    
    /**
     Uknown error
     **/
    Unknown
}
