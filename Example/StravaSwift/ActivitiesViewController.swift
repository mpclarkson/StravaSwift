//
//  ActivitiesViewController.swift
//  StravaSwift
//
//  Created by MATTHEW CLARKSON on 23/05/2016.
//  Copyright © 2016 Matthew Clarkson. All rights reserved.
//

import UIKit
import StravaSwift

class ActivitiesViewController: UITableViewController {
    private var activities: [Activity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
        update()
    }
}

extension ActivitiesViewController {
    private func update(params: [String: String]? = nil) {
        StravaClient.sharedInstance.request(Router.AthleteActivities(params)) { [weak self] (activities: [Activity]?) in
            guard let `self` = self, activities = activities else { return }
            self.activities = activities
            self.tableView?.reloadData()
        }
    }
}

extension ActivitiesViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("activity", forIndexPath: indexPath)
        let activity = activities[indexPath.row]
  
        cell.textLabel?.text = activity.name
        if let date = activity.startDate  {
            cell.detailTextLabel?.text = "\(date)"
        }
        
        return cell
    }
}
