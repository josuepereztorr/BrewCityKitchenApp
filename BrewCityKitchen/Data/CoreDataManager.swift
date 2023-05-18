//
//  CoreDataManager.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/18/23.
//

import CoreData

struct CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() {}
    
    let persistentContainer : NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    private func saveContext() {
        guard context.hasChanges else { return }

        do {
            try context.save()
        } catch {
            fatalError("Failed to save Core Data context: \(error)")
        }
    }
    
    // CRUD
    
    func createOrder() -> Order {
        let order = Order(context: context)
        order.orderId = UUID().uuidString
        order.orderStatus = "Pending"
        return order
    }
    
    func createItem(name: String, description: String, price: Double) -> Item {
        let item = Item(context: context)
        item.itemId = UUID().uuidString
        item.itemName = name
        item.itemPrice = price
        item.itemDescription = description
        return item
    }
    
    func fetchItem(id: String) -> Item? {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "itemId == %@", id)
        var item: [Item] = []
        
        do {
            item = try context.fetch(fetchRequest)
        } catch let error {
            print("Failed to fetch item: \(error)")
        }
        
        return item.first
    }
    
    func fetchItems() -> [Item] {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        var items: [Item] = []
        
        do {
            items = try context.fetch(request)
        } catch let error {
            print("Failed to fetch items: \(error)")
        }
        
        return items
    }
    
    func fetchOrders() -> [Order] {
        let request: NSFetchRequest<Order> = Order.fetchRequest()
        var orders: [Order] = []
        
        do {
            orders = try context.fetch(request)
        } catch let error {
            print("Failed to fetch orders: \(error)")
        }
        
        return orders
    }
    
    func updateOrder() {
        saveContext()
    }
    
    func deleteItem(item: Item) {
      let context = persistentContainer.viewContext
      context.delete(item)
      saveContext()
    }
    
    func deleteOrder(order: Order) {
      let context = persistentContainer.viewContext
      context.delete(order)
      saveContext()
    }
    
}

extension CoreDataManager {
    
    func removeMenuItems() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Item.fetchRequest()

        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
                try context.execute(deleteRequest)
                try context.save()
            } catch {
                print("Error deleting entities: \(error)")
            }
    }
    
    
    func populateMenu() {
        _ = createItem(
            name: "12\"\" Pepperoni Pizza",
            description: "A delicious pepperoni pizza is a mouthwatering culinary creation that tantalizes the taste buds. Picture a perfectly baked, thin and crispy crust that is golden brown and slightly charred, providing a satisfying crunch with every bite.",
            price: 12.99)
        _ = createItem(
            name: "French Fries",
            description: "French Fies are a delicious and satisfying snack or side dish that are loved by many. Imagine a plate of golden-brown, crispy fries, each one perfectly cooked to achieve a mouthwatering texture. These fries are made from high-quality potatoes, carefully cut into uniform strips or wedges, providing a consistent and enjoyable eating experience.",
            price: 4.99)
        _ = createItem(
            name: "Chicken Tacos",
            description: "Chicken Tacos are a delightful and flavorful dish that combines tender, seasoned chicken with an array of delicious toppings and tortillas. Picture succulent chicken pieces that have been marinated and cooked to perfection, resulting in juicy and flavorful meat.",
            price: 9.99)
        _ = createItem(
            name: "Grilled Cheese Sandwich",
            description: "Grilled Cheese sandwiches are a comforting and indulgent treat that satisfy both kids and adults alike. Imagine two slices of crusty bread enveloping a luscious layer of melted cheese, forming a golden-brown, crispy exterior.",
            price: 3.99)
        _ = createItem(
            name: "Nachos",
            description: "Nachos are a tantalizing and flavorful dish that combines crispy tortilla chips with a variety of savory toppings, resulting in a delicious and satisfying snack or appetizer. Imagine a bed of crispy, golden tortilla chips arranged on a plate, each chip sturdy enough to hold a generous amount of toppings. The chips are typically made from corn tortillas, providing a light and crunchy base for the flavors to come.",
            price: 8.99)
        _ = createItem(
            name: "All-American Cheese Burger",
            description: "The All-American double cheeseburger is a mouthwatering culinary creation that brings together juicy beef patties, melted cheese, and an array of delicious toppings. Imagine two perfectly grilled beef patties, cooked to perfection, with a tender and juicy interior and a deliciously charred exterior.",
            price: 12.99)
        _ = createItem(
            name: "Chicken Tenders",
            description: "Chicken Tenders are a delicious and satisfying dish that feature tender, breaded pieces of chicken. Picture succulent strips of boneless chicken breast, coated in a crispy and flavorful breading, resulting in a delightful combination of textures and flavors.",
            price: 4.99)
        _ = createItem(
            name: "Ceasar Salad",
            description: "A Caesar salad is a classic and refreshing dish that combines crisp romaine lettuce, tangy Caesar dressing, crunchy croutons, and savory Parmesan cheese. The star of the salad is the romaine lettuce, which is known for its fresh and crisp texture. The lettuce leaves are typically torn or chopped into bite-sized pieces, providing a satisfying crunch with every bite.",
            price: 14.99)

        saveContext()
    }
}

