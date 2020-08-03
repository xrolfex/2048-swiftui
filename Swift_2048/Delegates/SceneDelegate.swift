//
//  SceneDelegate.swift
//  Swift_2048
//
//  Created by Rolf, Eric on 7/23/19.
//  Copyright © 2019 Fifth Third Bank. All rights reserved.
//

import UIKit
import SwiftUI

/// Responsible for managing the `SwiftUI` scene.
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    /// Root Window the scene is tied to.
    var window: UIWindow?

    /// Tells the delegate about the addition of a scene to the app.
    /// - Parameter scene: The scene object being connected to your app.
    /// - Parameter session: The session object containing details about the scene's configuration.
    /// - Parameter connectionOptions: Additional options to use when configuring the scene. Use the information
    ///                                in this object to handle actions that caused the creation of the scene.
    ///                                For example, use it to respond to a quick action selected by the user.
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            //Subclassed HostingController to get keycommands for the scene.
            window.rootViewController = UIKeyCommandHostingController(rootView: GameView())
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
