//
//  MenuItemDetail.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/17/23.
//

import UIKit

class MenuItemDetailView: UIView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "car"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemPink
        return imageView
    }()
        
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .black
        label.numberOfLines = 0
//        label.backgroundColor = .green
        return label
    }()
        
     let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .darkGray
         label.numberOfLines = 25
//        label.backgroundColor = .red
        label.textAlignment = .left
        return label
    }()
        
    let addItemButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .black
        config.baseForegroundColor = .white
        config.buttonSize = .large
        config.cornerStyle = .medium
        
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let continueToMenuButton: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.title = "Return to Menu"
        config.baseBackgroundColor = .tertiarySystemBackground
        config.baseForegroundColor = .black
        config.buttonSize = .large
        config.cornerStyle = .medium
        
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(addItemButton)
        addSubview(continueToMenuButton)
        
        backgroundColor = .systemBackground

        let insetXMain = CGFloat(20)
        let insetYComponent = CGFloat(10)
        let insetYMain = CGFloat(10)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: insetYMain),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insetXMain),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insetXMain),
            titleLabel.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.10),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: insetYComponent),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insetXMain),
//            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insetYComponent),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insetXMain),
//            descriptionLabel.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.40),
            
//            addItemButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            addItemButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insetXMain),
            addItemButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insetXMain),

            continueToMenuButton.topAnchor.constraint(equalTo: addItemButton.bottomAnchor, constant: insetYComponent),
            continueToMenuButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insetXMain),
            continueToMenuButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insetXMain),
            continueToMenuButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -insetYMain)
        ])
    }
}

extension MenuItemDetailView {
    @objc private func checkout() {
        
    }
}
