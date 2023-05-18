//
//  MenuCollectionViewCell.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/16/23.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "MenuCollectionViewCell"
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Menu Item"
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray
        return separator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(separatorView)
        
        selectedBackgroundView = UIView()
        selectedBackgroundView?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        
        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}
