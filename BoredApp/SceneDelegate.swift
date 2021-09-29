//
//  SceneDelegate.swift
//  BoredApp
//
//  Created by mac on 21.09.2021.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        if windowScene == scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let navController = UINavigationController()
            let viewController = MainController()

            navController.viewControllers = [viewController]
            navController.isNavigationBarHidden = true
            window.rootViewController = navController
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}

 
