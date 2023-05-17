//
//  SceneDelegate.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/11/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let tabBarController = TabBarController()
        
        // setup controllers
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        
        let menuViewController = MenuViewController()
        let menuTabImage = UIImage(systemName: "fork.knife", withConfiguration: configuration)
        menuViewController.tabBarItem = UITabBarItem(title: "Menu", image: menuTabImage, tag: 1)
        
        let ordersViewController = OrdersViewController()
        let ordersTabImage = UIImage(systemName: "takeoutbag.and.cup.and.straw.fill", withConfiguration: configuration)
        ordersViewController.tabBarItem = UITabBarItem(title: "Orders", image: ordersTabImage, tag: 2)
        
        let profileViewController = ProfileViewController()
        let profileTabImage = UIImage(systemName: "person.fill", withConfiguration: configuration)
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: profileTabImage, tag: 3)
        
        let menuNavigationController = UINavigationController(rootViewController: menuViewController)
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        let ordersNavigationController = UINavigationController(rootViewController: ordersViewController)

        tabBarController.setViewControllers([ordersNavigationController, profileNavigationController], animated: true)
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
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
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

