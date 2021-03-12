//
//  AppDelegate.swift
//  DailymotionGithubUsers_App
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import UIKit
import DailymotionGithubUsers_iOS

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        DailymotionGithubUsers_iOS.startFlow(on: window)
        
        return true
    }
}

