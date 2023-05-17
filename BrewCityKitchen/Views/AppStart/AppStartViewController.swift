//
//  AppStartViewController.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/15/23.
//

import UIKit

class AppStartViewController: UIViewController {

    private lazy var appStartView = AppStartView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(appStartView)
        
        NSLayoutConstraint.activate([
            appStartView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appStartView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            appStartView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            appStartView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            appStartView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }
}
