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
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(appStartView)
        
        NSLayoutConstraint.activate([
            appStartView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            appStartView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            appStartView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            appStartView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            appStartView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }
}
