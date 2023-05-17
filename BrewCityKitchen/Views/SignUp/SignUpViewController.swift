//
//  SignUpViewController.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/11/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private lazy var signUpView = SignUpView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(signUpView)
        
        NSLayoutConstraint.activate([
            signUpView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            signUpView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            signUpView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }

}
