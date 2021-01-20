// ConnectViewController.swift
// Copyright (c) 2021 Copilot

import StravaSwift
import UIKit

class ConnectViewController: UIViewController {
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var activityIndicator: UIActivityIndicatorView?

    var code: String?
    private var token: OAuthToken?

    @IBAction func login(_: AnyObject) {
        activityIndicator?.startAnimating()
        loginButton.isHidden = true
        StravaClient.sharedInstance.authorize { [weak self] (result: Result<OAuthToken, Error>) in
            guard let self = self else { return }
            self.activityIndicator?.stopAnimating()
            self.loginButton.isHidden = false
            self.didAuthenticate(result: result)
        }
    }

    private func didAuthenticate(result: Result<OAuthToken, Error>) {
        switch result {
        case let .success(token):
            self.token = token
            performSegue(withIdentifier: "navigation", sender: self)
        case let .failure(error):
            debugPrint(error)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "navigation" {
            let barViewControllers = segue.destination as! UITabBarController
            let vc = barViewControllers.viewControllers![0] as! AthleteViewController
            vc.athlete = token?.athlete
        }
    }
}
