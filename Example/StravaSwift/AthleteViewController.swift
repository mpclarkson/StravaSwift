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
    func from(url url: NSURL?) {
        guard let
            url = url,
            data = NSData(contentsOfURL: url)
            else { return }
        
        self.image = UIImage(data: data)
    }
}


class AthleteViewController: UIViewController {
    
    var athlete: Athlete? {
        didSet {
            name?.text = "\(athlete?.firstname ?? "") \(athlete?.lastname ?? "")"
            avatar?.from(url: athlete?.profileMedium)
        }
    }
    
    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var avatar: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension AthleteViewController {
    
    func update() {
        StravaClient.sharedInstance.request(Router.Athlete) { [weak self] (athlete: Athlete?) in
            guard let `self` = self, athlete = athlete else { return }
            self.athlete = athlete
        }
    }
}
