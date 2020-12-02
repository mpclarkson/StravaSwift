//
//  Route.swift
//  Pods
//
//  Created by MATTHEW CLARKSON on 25/05/2016.
//
//

/**
 Routes are manually-created paths made up of sections called legs.
 **/
public struct Route: Decodable {
    public let id: Int?
    public let resourceState: ResourceState?
    public let name: String?
    public let description: String?
    public let athlete: Athlete?
    public let distance: Double?
    public let elevationGain: Double?
    public let map: Map?
    public let type: RouteType?
    public let subType: RouteSubType?
    public let isPrivate: Bool?
    public let starred: Bool?
    public let timeStamp: Int?
    public let segments: [Segment]?

    enum CodingKeys: String, CodingKey {
        case id
        case resourceState = "resource_state"
        case name
        case description
        case athlete
        case distance
        case elevationGain = "elevation_gain"
        case map
        case type
        case subType = "sub_type"
        case isPrivate = "private"
        case starred
        case timeStamp = "time_stamp"
        case segments
    }
}
