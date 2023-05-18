//
//  MenuItemCollectionViewCell.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/17/23.
//

import UIKit

class MenuItemCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "MenuItemCollectionViewCell"
    
    var imageView: UIImageView = {
        let configuration = UIImage.SymbolConfiguration(scale: .medium)
        let image = UIImage(systemName: "carrot.fill", withConfiguration: configuration)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.backgroundColor = .orange
        return imageView
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$0.00"
        label.textColor = .label
        label.font = .systemFont(ofSize: 22, weight: .regular)
//        label.backgroundColor = .systemRed
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Menu Item Name"
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .medium)
//        label.backgroundColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private lazy var seperatorView: UIView = {
        let seperatorView = UIView()
        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        seperatorView.backgroundColor = .lightGray
        return seperatorView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
//        contentView.backgroundColor = .green
        contentView.addSubview(imageView)
        contentView.addSubview(priceLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(seperatorView)
        
        selectedBackgroundView = UIView()
        selectedBackgroundView?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        
        let insetXMain = CGFloat(15)
        let insetYMain = CGFloat(10)
        
        let insetXComponent = CGFloat(5)
        let insetYComponent = CGFloat(3)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: insetYMain),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: insetXMain),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -insetYMain),
            imageView.rightAnchor.constraint(equalTo: priceLabel.leftAnchor, constant: -insetXComponent),
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),
            
            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            priceLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: insetXComponent),
            priceLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -insetYComponent),
            priceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -insetXMain),
            priceLabel.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 0.5),

            nameLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: insetYComponent),
            nameLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: insetXComponent),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -insetXComponent),
            
            seperatorView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            seperatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            seperatorView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            seperatorView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}
