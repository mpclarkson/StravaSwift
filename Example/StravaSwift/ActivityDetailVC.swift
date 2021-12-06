//
//  ActivityDetailVC.swift
//  StravaSwift_Example
//
//  Created by Michael Chartier on 12/6/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import StravaSwift


// This VC is presented by ActivitiesViewController
// The purpose here is to demonstrate how to download the details for just one specific activity.
// Yes the presenting VC already has those details, but for this demo we just ignore those and download again.
class ActivityDetailVC: UIViewController
{
    @IBOutlet weak var O_id: UILabel!
    @IBOutlet weak var O_name: UILabel!
    @IBOutlet weak var O_description: UILabel!
    
    

    var activityID: Int!        // set by the presenting VC
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Download the details for the specific activity by ID
        StravaClient.sharedInstance.request(Router.activities(id: activityID, params: nil), result: { [weak self] (activity: Activity?) in
            guard let self = self else { return }
            guard let activity = activity else { return }
            self.updateUI(activity: activity)
        }, failure: { (error: NSError) in
            debugPrint(error)
        })
    }

    private func updateUI( activity: Activity ) {
        if let id = activity.id {
            O_id.text = "ID: \(id)"
        } else {
            O_id.text = "ID: ??"
        }
        O_name.text = activity.name
        O_description.text = activity.description
    }

}


/*
 
 public let id: Int?
 public let resourceState: ResourceState?
 public let externalId: String?
 public let uploadId: Int?
 public let athlete: Athlete?
 public let name: String?
 public let description: String?
 public let distance: Double?
 public let movingTime: TimeInterval?
 public let elapsedTime: TimeInterval?
 public let highElevation : Double?
 public let lowElevation : Double?
 public let totalElevationGain: Double?
 public let type: ActivityType?
 public let startDate: Date?
 public let startDateLocal: Date?
 public let timeZone: String?
 public let startLatLng: Location?
 public let endLatLng: Location?
 public let achievementCount: Count?
 public let kudosCount: Count?
 public let commentCount: Count?
 public let athleteCount: Count?
 public let photoCount: Count?
 public let totalPhotoCount: Count?
 public let photos: [Photo]?
 public let map: Map?
 public let trainer: Bool?
 public let commute: Bool?
 public let manual: Bool?
 public let `private`: Bool?
 public let flagged: Bool?
 public let workoutType: WorkoutType?
 public let gear: Gear?
 public let averageSpeed: Speed?
 public let maxSpeed: Speed?
 public let calories: Double?
 public let hasKudoed: Bool?
 public let segmentEfforts: [Effort]?
 public let splitsMetric: [Split]?
 public let splitsStandard: [Split]?
 public let bestEfforts: [Split]?
 public let kiloJoules: Double?
 public let averagePower : Double?
 public let maxPower : Double?
 public let deviceWatts : Bool?
 public let hasHeartRate : Bool?
 public let averageHeartRate : Double?
 public let maxHeartRate : Double?

 */
