//
//  Constants.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/15/23.
//

import Foundation

struct Constants {
    enum Spacing {
        case XLarge
        case Large
        case Medium
        case Small
        case XSmall
        case XXSmall
        
        var value : CGFloat {
            switch self {
            case .XLarge: return 40
            case .Large: return 35
            case .Medium: return 30
            case .Small: return 25
            case .XSmall: return 20
            case .XXSmall: return 15
            }
        }
    }
}
