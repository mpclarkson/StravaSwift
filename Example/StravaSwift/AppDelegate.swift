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
    
    var strava: StravaClient?
    
    lazy var storyboard = { return UIStoryboard(name: "Main", bundle: nil) }()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let config = StravaConfig(
            clientId: 8873,
            clientSecret: "97b97b29ede769eec2dc26c52dd281b5a1efe594",
            redirectUri: "stravaswift://mpclarkson.github.io"
        )
        
        strava = StravaClient.sharedInstance.initWithConfig(config)
        loadInitialViewController()
        
        return true
    }
    
    private func loadInitialViewController() {
        if let _ = StravaClient.sharedInstance.token {
            window?.rootViewController = storyboard.instantiateViewControllerWithIdentifier("tab") as! UITabBarController
            self.window?.makeKeyAndVisible()
        }
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        guard let code = strava?.handleAuthorizationRedirect(url) else { return false }
        NSNotificationCenter.defaultCenter().postNotificationName("code", object: code )
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

