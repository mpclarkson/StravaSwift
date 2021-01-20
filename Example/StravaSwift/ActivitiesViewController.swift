// ActivitiesViewController.swift
// Copyright (c) 2021 Copilot

import StravaSwift
import UIKit

class ActivitiesViewController: UITableViewController {
    @IBOutlet var activityIndicator: UIActivityIndicatorView?

    fileprivate var activities: [Activity] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        update()
    }
}

private extension ActivitiesViewController {
    func update(params: Router.Params = nil) {
        activityIndicator?.startAnimating()
        StravaClient.sharedInstance.request(Router.athleteActivities(params: params), result: { [weak self] (activities: [Activity]?) in
            guard let self = self else { return }
            self.activityIndicator?.stopAnimating()

            guard let activities = activities else { return }
            self.activities = activities

            self.tableView?.reloadData()
        }, failure: { (error: NSError) in
            self.activityIndicator?.stopAnimating()
            debugPrint(error)
        })
    }
}

extension ActivitiesViewController {
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return activities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activity", for: indexPath)
        let activity = activities[indexPath.row]

        cell.textLabel?.text = activity.name
        if let date = activity.startDate {
            cell.detailTextLabel?.text = "\(date)"
        }

        return cell
    }
}
