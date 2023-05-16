//
//  OrdersViewController.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/15/23.
//

import UIKit

class OrdersViewController: UIViewController {
    
    private lazy var ordersListView = OrdersListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(ordersListView)
        
        NSLayoutConstraint.activate([
            ordersListView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            ordersListView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            ordersListView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            ordersListView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
        ])
    }

}
