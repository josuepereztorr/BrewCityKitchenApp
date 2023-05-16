//
//  OrderCollectionViewCell.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/15/23.
//

import UIKit

class OrderCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "OrderCollectionViewCell"
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Test Test"
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
        
//        NSLayoutConstraint.activate([
//            nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
//            nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
//            nameLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
//            nameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor)
//        ])
    }
}
