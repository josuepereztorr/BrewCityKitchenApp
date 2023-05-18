//
//  AppStartView.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/15/23.
//

import UIKit

class AppStartView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Brew City Kitchen"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()

    private lazy var loginBtn: ButtonView = {
        let btn = ButtonView()
        btn.configuration = btn.createButtonFilledConfiguration(title: "Login", background: .black, foreground: .white)
        return btn
    }()
    
    private lazy var signUpBtn: ButtonView = {
        let btn = ButtonView()
        btn.configuration = btn.createButtonFilledConfiguration(title: "Sign Up", background: .secondarySystemBackground, foreground: .black)
        return btn
    }()
    
    private lazy var componentStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.axis = .vertical
        stackView.spacing = Constants.Spacing.XXSmall.value
        return stackView
    }()
    
    private lazy var buttonStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.axis = .vertical
        stackView.spacing = Constants.Spacing.XXSmall.value
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(componentStackView)

        componentStackView.addArrangedSubview(titleLabel)
        componentStackView.addArrangedSubview(buttonStackView)

        buttonStackView.addArrangedSubview(loginBtn)
        buttonStackView.addArrangedSubview(signUpBtn)

        NSLayoutConstraint.activate([
            componentStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            componentStackView.topAnchor.constraint(equalTo: self.topAnchor),
            componentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            componentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            componentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
