//
//  SceneDelegate.swift
//  Moviemax
//
//  Created by Лаванда on 03.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let navController = UINavigationController(rootViewController: CreateAccountVC())
        let navController1 = UINavigationController(rootViewController: SecondStartViewController())
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.rootViewController = StartViewController()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            if let _ = UserDefaults.standard.object(forKey: "FirstRun") as? Int {
                self.window?.rootViewController = navController
            } else {
                self.window?.rootViewController = navController1
            }
        }

        
        if let currentScheme = UserDefaults.standard.value(forKey: "theme") as? Int {
            window?.rootViewController?.overrideUserInterfaceStyle = currentScheme == 1 ? .light : .dark
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
      
        StorageManader.shared.saveContext()
    }


}

