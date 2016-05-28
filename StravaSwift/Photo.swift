//
//  Photo.swift
//  StravaSwift
//
//  Created by MATTHEW CLARKSON on 23/05/2016.
//  Copyright © 2016 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 Photos are objects associated with an activity. Currently, the only external photo source is Instagram. Photos can also be stored on Strava - these photos are referred to as “native”.
 **/
public final class Photo: Strava, StravaResourceState {
    public var id: Int?
    public var uniqueId: String?
    public var activityId: Int?
    public var resourceState: ResourceState?
    public var urls: [NSURL]?
    public var caption: String?
    public var source: PhotoSource?
    public var uploadedAt: NSDate?
    public var createdAt: NSDate?
    public var location: Location?
    public var refs: String?
    public var uuid: String?
    public var type: String?
    
    /**
     Initializer
     
     - Parameter json: SwiftyJSON object
     - Internal
     **/
    required public init(_ json: JSON) {
        setResourceState(json)
        id = json["id"].int
        uniqueId = json["unique_id"].string
        activityId = json["activity_id"].int
        urls = json["urls"].dictionary?.flatMap { NSURL(optionalString: $0.1.string) }
        caption = json["caption"].string
        source = PhotoSource(optionalRawValue: json["source"].int)
        uploadedAt = json["uploaded_at"].string?.toDate()
        createdAt = json["created_at"].string?.toDate()
        location = Location(json["location"].array)
        refs = json["refs"].string
        uuid = json["uuid"].string
        type = json["type"].string
    }
}