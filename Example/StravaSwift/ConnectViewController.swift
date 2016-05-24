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
    
    @IBAction func login(sender: AnyObject) {
        strava.authorize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(self.performAuth(_:)),
                                                         name: "code",
                                                         object: nil)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func performAuth(notification: NSNotification) {
        
        guard let code = notification.object as? String else { return }
        
        loginButton.hidden = true
        strava.getAccessToken(code) { [weak self] token in
        if let `self` = self, token = token {
            self.token = token
            self.performSegueWithIdentifier("navigation", sender: self)
            }
            else {
            //async
                self?.loginButton.hidden = false
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "navigation" {
            let barViewControllers = segue.destinationViewController as! UITabBarController
            let vc = barViewControllers.viewControllers![0] as! AthleteViewController
            vc.athlete = self.token?.athlete
        }
    }
   
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

