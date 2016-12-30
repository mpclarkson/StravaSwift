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
        guard let u = url else { return }
        do {
            let data = try Data(contentsOf: u)
            self.image = UIImage(data: data)
        }
        catch {
            return
        }
    }
}


class AthleteViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var avatar: UIImageView?
    
    var athlete: Athlete? {
        didSet {
            name?.text = "\(athlete?.firstname ?? "") \(athlete?.lastname ?? "")"
            avatar?.from(url: athlete?.profileMedium)
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
}

extension AthleteViewController {
    
    func update() {
        try? StravaClient.sharedInstance.request(Router.athlete, result: { [weak self] (athlete: Athlete?) in
            guard let `self` = self, let athlete = athlete else { return }
            self.athlete = athlete
        }, failure: { (error: NSError) in
            debugPrint(error)
        })
    }
}
