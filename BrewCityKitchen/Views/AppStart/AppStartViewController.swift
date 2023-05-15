//
//  AppStartViewController.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/15/23.
//

import UIKit

class AppStartViewController: UIViewController {

    private lazy var startView = AppStartView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(startView)
        
        NSLayoutConstraint.activate([
            startView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            startView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            startView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            startView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            startView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }
}
