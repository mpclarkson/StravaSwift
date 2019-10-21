//
//  ViewController.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import StravaSwift
import UIKit

class ConnectViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?

    var code: String?
    private var token: OAuthToken?

    @IBAction func login(_ sender: AnyObject) {
        activityIndicator?.startAnimating()
        loginButton.isHidden = true
        StravaClient.sharedInstance.authorize() { [weak self] (result: Result<OAuthToken, Error>) in
            guard let self = self else { return }
            self.activityIndicator?.stopAnimating()
            self.loginButton.isHidden = false
            self.didAuthenticate(result: result)
        }
    }

    private func didAuthenticate(result: Result<OAuthToken, Error>) {
        switch result {
            case .success(let token):
                self.token = token
                self.performSegue(withIdentifier: "navigation", sender: self)
            case .failure(let error):
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
