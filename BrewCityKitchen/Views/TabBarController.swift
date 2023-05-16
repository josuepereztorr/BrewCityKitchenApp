//
//  TabBarController.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/15/23.
//

import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarControllers()
    }
    
    private func setupTabBarControllers() {
        let appStartViewController = AppStartViewController()
        appStartViewController.title = "App Start"
        
        let loginViewController = LoginViewController()
        loginViewController.title = "Login"
        
        let signUpViewController = SignUpViewController()
        signUpViewController.title = "Sign Up"
        
        let profileViewController = ProfileViewController()
        profileViewController.title = "Profile"
        
        let ordersViewController = OrdersViewController()
        ordersViewController.title = "Orders"
        
        self.setViewControllers([appStartViewController], animated: true)
    }
}
