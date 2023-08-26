//
//  SceneDelegate.swift
//  ME
//
//  Created by 새미 on 2023/08/08.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windonScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windonScene)
        
        let rootVC = TabBarViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        
        navVC.navigationBar.isHidden = true
        navVC.navigationBar.tintColor = .yellow
        
        self.window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        window?.backgroundColor = .background
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }

}

