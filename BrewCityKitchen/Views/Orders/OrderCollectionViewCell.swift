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
        imageView.backgroundColor = . white
        return imageView
    }()
    
    private lazy var statusLabel: UILabel = { 
        let label = UILabel()
        label.text = "STATUS"
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var orderIdLabel: UILabel = {
        let label = UILabel()
        label.text = "Order #ID"
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
    
    private lazy var bodyStack: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.axis = .vertical
        stackView.spacing = Constants.Spacing.Small.value
        stackView.backgroundColor = .systemPink
        return stackView
    }()
    
    private lazy var componentStack: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.axis = .horizontal
//        stackView.spacing = Constants.Spacing.XSmall.value
        stackView.backgroundColor = .green
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        contentView.addSubview(componentStack)
        
        componentStack.addArrangedSubview(imageView)
        componentStack.addArrangedSubview(bodyStack)
//        componentStack.addArrangedSubview(separatorView)
        
        bodyStack.addSubview(statusLabel)
        bodyStack.addSubview(orderIdLabel)
        
//        contentView.addSubview(separatorView)
        
        selectedBackgroundView = UIView()
        selectedBackgroundView?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        
        let insetX = CGFloat(0)
        let insetY = CGFloat(0)
        
        NSLayoutConstraint.activate([
            componentStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: insetY),
            componentStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -insetY),
            componentStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: insetX),
            componentStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -insetX),
            
            imageView.topAnchor.constraint(equalTo: componentStack.topAnchor, constant: insetY),
            imageView.bottomAnchor.constraint(equalTo: componentStack.bottomAnchor, constant: -insetY),
            imageView.leadingAnchor.constraint(equalTo: componentStack.leadingAnchor, constant: insetX),
            
            bodyStack.topAnchor.constraint(equalTo: componentStack.topAnchor, constant: insetY),
            bodyStack.bottomAnchor.constraint(equalTo: componentStack.bottomAnchor, constant: -insetY),
            bodyStack.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: insetX),
            bodyStack.rightAnchor.constraint(equalTo: componentStack.rightAnchor, constant: -insetX),
            
            statusLabel.topAnchor.constraint(equalTo: bodyStack.topAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: orderIdLabel.topAnchor),
            statusLabel.leftAnchor.constraint(equalTo: bodyStack.leftAnchor),
            statusLabel.rightAnchor.constraint(equalTo: bodyStack.rightAnchor),
            
            orderIdLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor),
            orderIdLabel.bottomAnchor.constraint(equalTo: bodyStack.bottomAnchor),
            orderIdLabel.leftAnchor.constraint(equalTo: bodyStack.leftAnchor),
            orderIdLabel.rightAnchor.constraint(equalTo: bodyStack.rightAnchor)
            
            
//            imageView.topAnchor.constraint(equalTo: componentStack.topAnchor),
//            imageView.bottomAnchor.constraint(equalTo: componentStack.bottomAnchor),
//            imageView.leadingAnchor.constraint(equalTo: componentStack.leadingAnchor),
            
//            bodyStack.topAnchor.constraint(equalTo: componentStack.topAnchor),
//            bodyStack.bottomAnchor.constraint(equalTo: componentStack.bottomAnchor),
//            bodyStack.leadingAnchor.constraint(equalTo: imageView.trailingAnchor)
             
        ])
        
//        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: insetY),
//            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -insetY),
//            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: insetX),
//
//            statusLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: insetX),
//            statusLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: insetY),
//            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -insetY),
//
//            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: insetX),
//            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -insetX),
//            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            separatorView.heightAnchor.constraint(equalToConstant: 0.5)
//        ])
    }
}
