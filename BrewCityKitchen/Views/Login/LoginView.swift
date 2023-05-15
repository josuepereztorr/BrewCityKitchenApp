//
//  LogInView.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/11/23.
//

import UIKit

final class LoginView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
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

    private lazy var emailField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        textField.placeholder = "Email"
        return textField
    }()
    
    private lazy var passwordField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        textField.placeholder = "Password"
        return textField
    }()
    
    private lazy var formStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.axis = .vertical
        stackView.spacing = Constants.Spacing.Small.value
        return stackView
    }()
    
    private lazy var buttonStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.axis = .vertical
        stackView.spacing = Constants.Spacing.XXSmall.value
        return stackView
    }()
    
    private lazy var componentsStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.axis = .vertical
        stackView.spacing = Constants.Spacing.Small.value
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
        self.addSubview(componentsStackView)
        
        componentsStackView.addArrangedSubview(titleLabel)
        componentsStackView.addArrangedSubview(formStackView)
        componentsStackView.addArrangedSubview(buttonStackView)
        
        buttonStackView.addArrangedSubview(loginBtn)
        buttonStackView.addArrangedSubview(signUpBtn)
        
        formStackView.addArrangedSubview(emailField)
        formStackView.addArrangedSubview(passwordField)
        
        NSLayoutConstraint.activate([
            componentsStackView.topAnchor.constraint(equalTo: self.topAnchor),
            componentsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            componentsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            componentsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
