// AppDelegate.swift
// Copyright (c) 2021 Copilot

import StravaSwift
import UIKit

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

    lazy var storyboard = { UIStoryboard(name: "Main", bundle: nil) }()

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        loadInitialViewController()
        return true
    }

    private func loadInitialViewController() {
        if let _ = StravaClient.sharedInstance.token {
            window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "tab") as! UITabBarController
            window?.makeKeyAndVisible()
        }
    }

    func application(_: UIApplication, open url: URL, options _: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return strava.handleAuthorizationRedirect(url)
    }
}
