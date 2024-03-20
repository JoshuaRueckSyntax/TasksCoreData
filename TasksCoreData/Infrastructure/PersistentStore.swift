//
//  Persistentstore.swift
//  TasksCoreData
//
//  Created by Joshua Rück on 20.03.24.
//

import Foundation
import CoreData

class PersistentStore {
    
    private let container: NSPersistentContainer
    var context: NSManagedObjectContext { container.viewContext }
    
    init() {
        container = NSPersistentContainer(name: "TaskModel")
        container.loadPersistentStores { _, error in
            if let error {
                fatalError("Error: \(error)")
            }
        }
    }
    
    func save() throws {
        try context.save()
    }
    
}
