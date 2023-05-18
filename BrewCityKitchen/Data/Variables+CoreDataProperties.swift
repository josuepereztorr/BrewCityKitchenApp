//
//  Variables+CoreDataProperties.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/18/23.
//
//

import Foundation
import CoreData


extension Variables {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Variables> {
        return NSFetchRequest<Variables>(entityName: "Variables")
    }

    @NSManaged public var isNewOrderCreated: Bool

}

extension Variables : Identifiable {

}
