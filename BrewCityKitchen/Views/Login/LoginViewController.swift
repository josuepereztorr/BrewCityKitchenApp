//
//  LogInViewController.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/11/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var loginView = LoginView()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(loginView)
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 25),
            loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40)
        ])
    }
}
