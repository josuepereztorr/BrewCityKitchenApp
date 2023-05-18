//
//  MenuItemDetailViewController.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/17/23.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    
    let modalView = MenuItemDetailView()
    
    var item: Item
    
    var currentOrder: Order
    
    private let context = CoreDataManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    init(item: Item, currentOrder: Order) {
        self.item = item
        self.currentOrder = currentOrder
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        modalView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(modalView)
        
        NSLayoutConstraint.activate([
            modalView.topAnchor.constraint(equalTo: view.topAnchor),
            modalView.leftAnchor.constraint(equalTo: view.leftAnchor),
            modalView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            modalView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
//        cardView.photoImageView.image = UIImage(named: "example_photo")
        modalView.addItemButton.configuration?.title = "Add to Order"
        modalView.addItemButton.addTarget(self, action: #selector(addToOrder), for: .touchUpInside)
        modalView.continueToMenuButton.addTarget(self, action: #selector(dismissViewControllers), for: .touchUpInside)
        modalView.titleLabel.text = item.itemName
        modalView.descriptionLabel.text = item.itemDescription
    }
    
    @objc func addToOrder() {
        currentOrder.addToItems(item)
        print("\(item.itemName) added to the order")
        
        let checkoutViewController = CheckoutViewController(currentOrder: currentOrder)
         
        present(checkoutViewController, animated: true)
    }
    
}

extension MenuItemDetailViewController {
    @objc private func dismissViewControllers() {
        dismiss(animated: true)
    }
}
