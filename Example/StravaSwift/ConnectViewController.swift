//
//  ViewController.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import UIKit
import StravaSwift

class ConnectViewController: UIViewController {

    private var strava = StravaClient.sharedInstance
    
    @IBOutlet weak var loginButton: UIButton!
  
    var code: String?
    private var token: OAuthToken?
    
    @IBAction func login(_ sender: AnyObject) {
        strava.authorize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.performAuth(notification:)),
                                               name: NSNotification.Name("code"),
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func performAuth( notification: NSNotification) {
        
        guard let code = notification.object as? String else { return }
        
        loginButton.isHidden = true
        try? strava.getAccessToken(code) { [weak self] token in
            if let `self` = self, let token = token {
                self.token = token
                self.performSegue(withIdentifier: "navigation", sender: self)
                }
                else {
                //async
                    self?.loginButton.isHidden = false
                }
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "navigation" {
            let barViewControllers = segue.destination as! UITabBarController
            let vc = barViewControllers.viewControllers![0] as! AthleteViewController
            vc.athlete = self.token?.athlete
        }
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

