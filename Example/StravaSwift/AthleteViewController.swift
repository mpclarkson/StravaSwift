//
//  ProfileViewController.swift
//  StravaSwift
//
//  Created by MATTHEW CLARKSON on 20/05/2016.
//  Copyright © 2016 Matthew Clarkson. All rights reserved.
//

import UIKit
import StravaSwift

extension UIImageView {
    func from(url: URL?) {
        guard let url = url else { return }
        do {
            let data = try Data(contentsOf: url)
            self.image = UIImage(data: data)
        }
        catch {
            return
        }
    }
}


class AthleteViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?

    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var avatar: UIImageView?
    @IBOutlet weak var rides: UILabel?
    @IBOutlet weak var runs: UILabel?
    @IBOutlet weak var swims: UILabel?
    @IBOutlet weak var O_upload: UIButton!
    @IBOutlet weak var O_uploadSpinner: UIActivityIndicatorView!
    @IBOutlet weak var O_monitor: UIButton!
    
    var athlete: Athlete? {
        didSet {
            name?.text = "\(athlete?.firstname ?? "") \(athlete?.lastname ?? "")"
            avatar?.from(url: athlete?.profile)
        }
    }
    
    var stats: AthleteStats? {
        didSet {
            if let ridesInt = stats?.allRideTotals?.count {
                rides?.text = String(ridesInt)
            }
            if let runsInt = stats?.allRunTotals?.count {
                runs?.text = String(runsInt)
            }
            if let swimsInt = stats?.allSwimTotals?.count {
                swims?.text = String(swimsInt)
            }
        }
    }
    
 
    // Couple counters used for uploading new activities
    var uploadID: Int?
    var activityID: Int?
    var matchCounter = 0
    var previousEffortCount = 0
    var monitorCounter = 0
    let maximumReties = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    @IBAction func A_upload(_ sender: Any) {
        O_upload.setTitle("Uploading...", for: .normal)
        O_upload.isEnabled = false
        O_monitor.isHidden = true
        O_uploadSpinner.startAnimating()

        // Grab a GPX test file from the app bundle. Load it into a Data object.
        guard let filePath = Bundle.main.url(forResource: "test2", withExtension: "gpx") else { return }
        guard let fileData = try? Data(contentsOf: filePath) else { return }

        let params = StravaSwift.UploadData(activityType: .ride, name: "test1", description: "upload test", private: false, trainer: nil, externalId: nil, dataType: .gpx, file: fileData)
        
        StravaClient.sharedInstance.upload(Router.uploadFile(upload: params), upload: params, result: { [weak self] (status: UploadStatus?) in
            guard let self = self else { return }
            if let status = status, let uploadID = status.id {
                // At this point only status.id will be valid. All other properties will be nil.
                self.uploadID = uploadID
                self.O_upload.setTitle("Processing new activity", for: .normal)
                self.monitorCounter = self.maximumReties
                self.monitorUploadProgress()
            }}, failure: { (error: NSError) in
                debugPrint(error)
                self.doAlert(title: "Strava Error", message: error.localizedDescription)
            })
    }
    
    @IBAction func A_monitor(_ sender: Any) {
        O_monitor.setTitle("Monitoring...", for: .normal)
        O_monitor.isEnabled = false
        O_uploadSpinner.startAnimating()
        monitorSegments()
    }
    
    private func monitorUploadProgress() {
        // Monitor the upload record until we get a valid activityID
        guard let uploadID = uploadID else { return }
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
            StravaClient.sharedInstance.request(Router.uploads(id: uploadID), result: { [weak self] (status: UploadStatus?) in
                guard let self = self else { return }
                guard let status = status else { return }
                if let error = status.error {
                    self.doAlert(title: "Upload Failed", message: error)
                    return
                } else if let activityID = status.activityId {
                    // We have a valid activityID so the upload is considered complete.
                    // However, note that segment processing can continue for quite a while.
                    self.activityID = activityID
                    self.O_upload.setTitle("Upload Complete", for: .normal)
                    self.O_uploadSpinner.stopAnimating()
                    self.O_monitor.setTitle("Monitor Segments", for: .normal)
                    self.O_monitor.isHidden = false
                    self.O_monitor.isEnabled = true
                } else {
                    // Start another timer
                    self.monitorUploadProgress()
                }
            }, failure: { (error: NSError) in
                debugPrint(error)
            })
        }
    }
    
    private func monitorSegments() {
        // We want to know when the Strava server has finished processing the new upload.
        // Processing can take anywhere from a few seconds to several minutes depending on many factors.
        // When we first upload a new activity the number of segments will be zero.
        // This number will increase as new segments are detected by the Strava server.
        // This number will stay at zero if no segments are found.
        // For example, for a 3 hour recording with 20 segments this number will typically increment
        // by 1 or 2 every second until all 20 segments are found.
        // As far as I can tell, there is no "done" flag we can monitor.
        // The approach here is to check segment_count once every 2 seconds until we detect no further changes.

        monitorCounter = maximumReties
        matchCounter = 0
        previousEffortCount = 0
        
        getEffortCount()
    }
    
    private func getEffortCount() {
        guard let activityID = activityID else { return }
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
            // Download the details for the specific activity by ID
            StravaClient.sharedInstance.request(Router.activities(id: activityID, params: nil), result: { [weak self] (activity: Activity?) in
                guard let self = self else { return }
                guard let activity = activity else { return }
                if let efforts = activity.segmentEfforts, efforts.count > 0 {
                    if efforts.count == self.previousEffortCount {
                        self.matchCounter += 1
                        if (self.matchCounter >= 3) {
                            // There is a good chance that processing has completed.
                            self.O_monitor.setTitle("\(efforts.count) segments found", for: .normal)
                            self.O_uploadSpinner.stopAnimating()
                            self.O_upload.isEnabled = true
                            return  // stop monitoring
                        }
                    }
                    self.previousEffortCount = efforts.count
                }
                // Schedule another timer OR abort
                self.monitorCounter -= 1
                if (self.monitorCounter > 0) {
                    self.getEffortCount()
                } else {
                    self.O_monitor.setTitle("Timeout Error", for: .normal)
                    self.O_uploadSpinner.stopAnimating()
                    self.O_upload.isEnabled = true
                }
            }, failure: { (error: NSError) in
                debugPrint(error)
                self.doAlert(title: "Strava Error", message: error.localizedDescription)
            })
        }
    }
    
    func doAlert(title: String, message: String)
    {
        O_uploadSpinner.stopAnimating()
        O_upload.setTitle("Upload to Strava", for: .normal)
        O_upload.isEnabled = true
        O_monitor.isHidden = true
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension AthleteViewController {
    
    func update() {
        activityIndicator?.startAnimating()
        StravaClient.sharedInstance.request(Router.athlete, result: { [weak self] (athlete: Athlete?) in
            guard let self = self else { return }
            self.activityIndicator?.stopAnimating()

            guard let athlete = athlete else { return }
            self.athlete = athlete
            
            StravaClient.sharedInstance.request(Router.athletesStats(id: athlete.id!, params: nil), result: { [weak self] (stats: AthleteStats?) in
                guard let self = self else { return }
                self.activityIndicator?.stopAnimating()
                self.stats = stats
            
            }, failure: { (error: NSError) in
                self.activityIndicator?.stopAnimating()
                debugPrint(error)
            })
            
        }, failure: { (error: NSError) in
            self.activityIndicator?.stopAnimating()
            debugPrint(error)
        })
    }
}
