//
//  MenuItemDetailViewController.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/17/23.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    
    var item: Item
    
    private let context = CoreDataManager.shared
    
    var itemId: String = " "

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    init(menuItem: Item) {
        self.item = menuItem
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let cardView = MenuItemDetailView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardView)
        
        NSLayoutConstraint.activate([
//            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            cardView.widthAnchor.constraint(equalToConstant: 300.0),
//            cardView.heightAnchor.constraint(equalToConstant: 300.0)
            cardView.topAnchor.constraint(equalTo: view.topAnchor),
            cardView.leftAnchor.constraint(equalTo: view.leftAnchor),
            cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cardView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
//        cardView.photoImageView.image = UIImage(named: "example_photo")
        cardView.actionButton.configuration?.title = "Add to Order"
        cardView.titleLabel.text = item.itemName
        cardView.descriptionLabel.text = item.itemDescription
    }
    
    
    
}
