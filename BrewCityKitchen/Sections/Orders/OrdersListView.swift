//
//  OrdersListView.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/15/23.
//

import UIKit

class OrdersListView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
//            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor)
//        ])
    }

}
