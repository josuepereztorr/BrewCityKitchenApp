//
//  Item+CoreDataProperties.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/18/23.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var itemId: String
    @NSManaged public var itemDescription: String
    @NSManaged public var itemName: String
    @NSManaged public var itemPrice: Double
    @NSManaged public var order: Order?

}

extension Item : Identifiable {

}
