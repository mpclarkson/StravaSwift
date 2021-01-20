// AthleteViewController.swift
// Copyright (c) 2021 Copilot

import StravaSwift
import UIKit

extension UIImageView {
    func from(url: URL?) {
        guard let url = url else { return }
        do {
            let data = try Data(contentsOf: url)
            image = UIImage(data: data)
        } catch {
            return
        }
    }
}

class AthleteViewController: UIViewController {
    @IBOutlet var activityIndicator: UIActivityIndicatorView?

    @IBOutlet var name: UILabel?
    @IBOutlet var avatar: UIImageView?

    @IBOutlet var rides: UILabel?
    @IBOutlet var runs: UILabel?
    @IBOutlet var swims: UILabel?

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
