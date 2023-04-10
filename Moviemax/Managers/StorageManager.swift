//
//  StorageManager.swift
//  Moviemax
//
//  Created by Лаванда on 10.04.2023.
//

import UIKit
import CoreData

final class StorageManader {
    private init() {}
    static let shared = StorageManader()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Moviemax")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var viewContex: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveUser() {
        
    }

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    
}
