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

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?

    var code: String?
    private var token: OAuthToken?
    
    @IBAction func login(_ sender: AnyObject) {
        activityIndicator?.startAnimating()
        loginButton.isHidden = true
        StravaClient.sharedInstance.authorize() { [weak self] (token, error) in
            guard let self = self else { return }
            self.activityIndicator?.stopAnimating()
            self.loginButton.isHidden = false
            self.didAuthenticate(token: token, error: error) // Called when running iOS 11 and above
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.willHandleToken(notification:)),
                                               name: NSNotification.Name("willHandleToken"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.didHandleToken(notification:)),
                                               name: NSNotification.Name("didHandleToken"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func willHandleToken(notification: NSNotification) {
        activityIndicator?.startAnimating()
        loginButton.isHidden = true
    }

    @objc func didHandleToken(notification: NSNotification) {
        activityIndicator?.stopAnimating()
        loginButton.isHidden = false
        guard let (token, error) = notification.object as? (OAuthToken?, NSError?) else { return }
        didAuthenticate(token: token, error: error) // Called when running iOS 9 or 10
    }

    private func didAuthenticate(token: OAuthToken?, error: NSError?) {
        if let token = token {
            self.token = token
            self.performSegue(withIdentifier: "navigation", sender: self)
        } else if let error = error {
            debugPrint(error)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navigation" {
            let barViewControllers = segue.destination as! UITabBarController
            let vc = barViewControllers.viewControllers![0] as! AthleteViewController
            vc.athlete = self.token?.athlete
        }
    }
}
