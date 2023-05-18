//
//  ButtonView.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/15/23.
//

import UIKit

final class ButtonView: UIButton {
    
    private lazy var button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createButtonFilledConfiguration(title: String, background: UIColor, foreground: UIColor) -> UIButton.Configuration {
        var config = UIButton.Configuration.filled()
        config.title = title
        config.baseBackgroundColor = background
        config.baseForegroundColor = foreground
        config.buttonSize = .large
        config.cornerStyle = .medium
        return config
    }
}
