//
//  AppDelegate.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import UIKit
import StravaSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let strava: StravaClient
    
    override init() {
        let config = StravaConfig(
            clientId: 8873,
            clientSecret: "97b97b29ede769eec2dc26c52dd281b5a1efe594",
            redirectUri: "stravaswift://mpclarkson.github.io",
            scopes: [.activityReadAll]
        )
        strava = StravaClient.sharedInstance.initWithConfig(config)

        super.init()
    }
    
    lazy var storyboard = { return UIStoryboard(name: "Main", bundle: nil) }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        loadInitialViewController()
        return true
    }

    private func loadInitialViewController() {
        if let _ = StravaClient.sharedInstance.token {
            window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "tab") as! UITabBarController
            self.window?.makeKeyAndVisible()
        }
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return strava.handleAuthorizationRedirect(url)
    }
}
