// Photo.swift
// Copyright (c) 2021 Copilot

import Foundation
import SwiftyJSON

/**
 Photos are objects associated with an activity. Currently, the only external photo source is Instagram. Photos can also be stored on Strava - these photos are referred to as “native”.
 **/
public struct Photo: Strava, Hashable {
    public let id: Int?
    public let uniqueId: String?
    public let activityId: Int?
    public let resourceState: ResourceState?
    public let urls: [URL]?
    public let caption: String?
    public let source: PhotoSource?
    public let uploadedAt: Date?
    public let createdAt: Date?
    public let location: Location?
    public let refs: String?
    public let uuid: String?
    public let type: String?

    /**
     Initializer

     - Parameter json: SwiftyJSON object
     - Internal
     **/
    public init(_ json: JSON) {
        id = json["id"].int
        resourceState = json["resource_state"].strava(ResourceState.self)
        uniqueId = json["unique_id"].string
        activityId = json["activity_id"].int
        urls = json["urls"].dictionary?.compactMap { URL(optionalString: $0.1.string) }
        caption = json["caption"].string
        source = json["source"].strava(PhotoSource.self)
        uploadedAt = json["uploaded_at"].string?.toDate()
        createdAt = json["created_at"].string?.toDate()
        location = json["location"].strava(Location.self)
        refs = json["refs"].string
        uuid = json["uuid"].string
        type = json["type"].string
    }
}
