//
//  Photo.swift
//  StravaSwift
//
//  Created by MATTHEW CLARKSON on 23/05/2016.
//  Copyright © 2016 Matthew Clarkson. All rights reserved.
//

import Foundation

/**
 Photos are objects associated with an activity. Currently, the only external photo source is Instagram. Photos can also be stored on Strava - these photos are referred to as “native”.
 **/
public struct Photo: Decodable {
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

    enum CodingKeys: String, CodingKey {
        case id
        case resourceState = "resource_state"
        case uniqueId = "unique_id"
        case activityId = "activity_id"
        case urls
        case caption
        case source
        case uploadedAt = "uploaded_at"
        case createdAt = "created_at"
        case location
        case refs
        case uuid
        case type
    }
}
