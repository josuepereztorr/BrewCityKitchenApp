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
    
    func prePopulateItems() {
        createItem(
            name: "French Fries",
            price: 4.99,
            description: "French Fies are a delicious and satisfying snack or side dish that are loved by many. Imagine a plate of golden-brown, crispy fries, each one perfectly cooked to achieve a mouthwatering texture. These fries are made from high-quality potatoes, carefully cut into uniform strips or wedges, providing a consistent and enjoyable eating experience.")
        createItem(
            name: "Pepperoni Pizza",
            price: 12.99,
            description: "A delicious pepperoni pizza is a mouthwatering culinary creation that tantalizes the taste buds. Picture a perfectly baked, thin and crispy crust that is golden brown and slightly charred, providing a satisfying crunch with every bite.")
        
        saveContext()
    }
    
    
    // CRUD
    
    func createOrder() -> Order {
        let order = Order(context: context)
        order.id = UUID().uuidString
        return order
    }
    
    func createItem(name: String, price: Double, description: String) -> Item {
        let item = Item(context: context)
        item.itemName = name
        item.itemPrice = price
        item.itemDescription = description
        return item
    }
    
    func fetchItem(id: String) -> Item? {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
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

