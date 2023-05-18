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
        
    let actionButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .black
        config.baseForegroundColor = .white
        config.buttonSize = .large
        config.cornerStyle = .medium
        
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
//        button.addTarget(self, action: #selector(secondaryButtonTapped), for: .touchUpInside)
//        return button
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
        addSubview(actionButton)
        
        backgroundColor = .systemBackground

        let insetXMain = CGFloat(20)
        let insetYComponent = CGFloat(5)
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
            descriptionLabel.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.40),
            
            actionButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insetXMain),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insetXMain),
        ])
    }
    

}
