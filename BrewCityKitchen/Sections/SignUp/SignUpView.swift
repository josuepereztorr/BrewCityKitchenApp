//
//  SignUpView.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/11/23.
//

import UIKit

class SignUpView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    
    private lazy var signUpButton: ButtonView = {
        let btn = ButtonView()
        btn.configuration = btn.createButtonFilledConfiguration(title: "Sign Up", background: .black, foreground: .white)
        return btn
    }()
    
    private lazy var firstNameField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        textField.placeholder = "First Name"
        return textField
    }()
    
    private lazy var lastNameField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        textField.placeholder = "Last Name"
        return textField
    }()
    
    private lazy var emailField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        textField.placeholder = "Email"
        return textField
    }()
    
    private lazy var phoneNumberField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        textField.placeholder = "Phone Number"
        return textField
    }()
    
    private lazy var passwordField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var confirmPasswordField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        textField.placeholder = "Confirm Password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var formStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.axis = .vertical
        stackView.spacing = Constants.Spacing.XSmall.value
        return stackView
    }()
    
    private lazy var buttonStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.axis = .vertical
        stackView.spacing = Constants.Spacing.XSmall.value
        return stackView
    }()
    
    private lazy var componentsStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.axis = .vertical
        stackView.spacing = Constants.Spacing.Medium.value
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
        
        buttonStackView.addArrangedSubview(signUpButton)
        
        formStackView.addArrangedSubview(firstNameField)
        formStackView.addArrangedSubview(lastNameField)
        formStackView.addArrangedSubview(emailField)
        formStackView.addArrangedSubview(phoneNumberField)
        formStackView.addArrangedSubview(passwordField)
        formStackView.addArrangedSubview(confirmPasswordField)
        
        NSLayoutConstraint.activate([
            componentsStackView.topAnchor.constraint(equalTo: self.topAnchor),
            componentsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            componentsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            componentsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
