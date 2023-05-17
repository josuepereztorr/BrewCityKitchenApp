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
        view.backgroundColor = .systemBackground
        view.addSubview(loginView)
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            loginView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            loginView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }
}
