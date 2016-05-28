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
public struct Upload: Strava {
//
//    activity_type:	string optional, case insensitive
//    possible values: ride, run, swim, workout, hike, walk, nordicski, alpineski, backcountryski, iceskate, inlineskate, kitesurf, rollerski, windsurf, workout, snowboard, snowshoe, ebikeride, virtualride
//    Type detected from file overrides, uses athlete’s default type if not specified
//    name:	string optional
//    if not provided, will be populated using start date and location, if available
//    description:	string optional
//    private:	integer optional
//    set to 1 to mark the resulting activity as private, ‘view_private’ permissions will be necessary to view the activity
//    trainer:	integer optional
//    activities without lat/lng info in the file are auto marked as stationary, set to 1 to force
//    commute:	integer optional
//    set to 1 to mark as commute
//    data_type:	string required case insensitive
//    possible values: fit, fit.gz, tcx, tcx.gz, gpx, gpx.gz
//    external_id:	string optional
//    data filename will be used by default but should be a unique identifier
//    file:	multipart/form-data required
//    the actual activity data, if gzipped the data_type must end with .gz
//    
//    
    /**
     Initializer
     
     - Parameter json: SwiftyJSON object
     - Internal
     **/
    public init(_ json: JSON) {
        fatalError("Not yet implemented")
    }
}
