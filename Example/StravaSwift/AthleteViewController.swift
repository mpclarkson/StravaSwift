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
 
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
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
