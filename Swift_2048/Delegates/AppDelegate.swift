//
//  AppDelegate.swift
//  Swift_2048
//
//  Created by Rolf, Eric on 7/23/19.
//  Copyright © 2019 Fifth Third Bank. All rights reserved.
//

import UIKit

/// Swift_2048 App Delegate
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    /// Entry Point into Application
    /// - Parameter application: Application context
    /// - Parameter launchOptions: Dictionary of values passed into the launch of theh application.
    /// - Returns: `Bool` if application was successfully launched.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    /// UISceneSession Delegate
    /// - Parameter application: Application context
    /// - Parameter connectingSceneSession: Scene session context
    /// - Parameter options: `UIScene.ConnectionOptions`
    /// - Returns: `UISceneConfiguration` that represents the scene configuration to load.
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    /// UISceneSession Destruction
    /// - Parameter application: Application context
    /// - Parameter sceneSessions: Set of scene session contexts
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) { }

}
