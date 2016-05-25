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
 Uploading to Strava is an asynchronous process. A file is uploaded using a multipart/form-data POST request which performs initial checks on the data and enqueues the file for processing. The activity will not appear in other API requests until it has finished processing successfully.
 
 Processing status may be checked by polling Strava. A one-second or longer polling interval is recommended. The mean processing time is currently around 8 seconds. Once processing is complete, Strava will respond to polling requests with the activity’s ID.
 
 Errors can occur during the submission or processing steps and may be due to malformed activity data or duplicate data submission.
 
 - Warning: Not yet implemented
 **/
public class Upload: Strava {
    public var id: Int?
    
    required public init(_ json: JSON) {
        fatalError("Not yet implemented")
    }
}
