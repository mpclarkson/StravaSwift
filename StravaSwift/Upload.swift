//
//  Upload.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 Upload struct
 
 Uploading to Strava is an asynchronous process. A file is uploaded using a multipart/form-data POST request which performs initial checks on the data and enqueues the file for processing. The activity will not appear in other API requests until it has finished processing successfully.
 
 Processing status may be checked by polling Strava. A one-second or longer polling interval is recommended. The mean processing time is currently around 8 seconds. Once processing is complete, Strava will respond to polling requests with the activity’s ID.
 
 Errors can occur during the submission or processing steps and may be due to malformed activity data or duplicate data submission.
 
 - warning: Not yet tested
 
 **/
public struct Upload {
    public let activityType: ActivityType?
    public let name: String?
    public let description: String?
    public let `private`: Bool?
    public let trainer: Bool?
    public let externalId: String?

    public let dataType: DataType
    public let file: NSData
    
    internal var params: [String: AnyObject?] {
        
        return [
            "data_type": dataType.rawValue,
            "file": file,
            "name": name,
            "description": description,
            "private": `private`,
            "trainer": trainer,
            "external_id": externalId
        ]
    }
    
    /**
       Upload status
     **/
    public final class Status: Strava {
        let id: Int?
        let externalId: String?
        let error: String?
        let status: String?
        let activityId: Int?
        
        public required init(_ json: JSON) {
            id = json["id"].int
            externalId = json["external_id"].string
            error = json["error"].string
            status = json["status"].string
            activityId = json["activity_id"].int
        }
    }
}

