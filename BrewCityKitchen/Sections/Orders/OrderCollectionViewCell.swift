//
//  OrderCollectionViewCell.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/15/23.
//

import UIKit

class OrderCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "OrderCollectionViewCell"
    
    private lazy var imageView: UIImageView = {
        let configuration = UIImage.SymbolConfiguration(scale: .medium)
        let image = UIImage(systemName: "car", withConfiguration: configuration)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var statusLabel: UILabel = { 
        let label = UILabel()
        label.text = "PENDING"
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var orderIdLabel: UILabel = {
        let label = UILabel()
        label.text = "Order #56"
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
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
        contentView.addSubview(imageView)
        contentView.addSubview(statusLabel)
        contentView.addSubview(orderIdLabel)
        contentView.addSubview(seperatorView)
        
        selectedBackgroundView = UIView()
        selectedBackgroundView?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        
        let insetXMain = CGFloat(20)
        let insetYMain = CGFloat(5)
        
        let insetXComponent = CGFloat(10)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: insetYMain),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: insetXMain),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -insetYMain),
            imageView.rightAnchor.constraint(equalTo: statusLabel.leftAnchor, constant: -insetXComponent),
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),
            
            statusLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            statusLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: insetXComponent),
            statusLabel.bottomAnchor.constraint(equalTo: orderIdLabel.topAnchor, constant: -insetYMain),
            statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -insetXMain),
            statusLabel.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 0.5),

            orderIdLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: insetYMain),
            orderIdLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: insetXComponent),
            orderIdLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            orderIdLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -insetXComponent),
            
            seperatorView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            seperatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            seperatorView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            seperatorView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}
