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
    
    private var persistentContainer: NSPersistentContainer = {
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
    
    func saveUser(completion: (User) -> Void) {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: viewContex) else { return }
        let user = NSManagedObject(entity: entityDescription, insertInto: viewContex) as! User
        completion(user)
        saveContext()
    }
    
    func findUser(email: String?, password: String?) -> User? {
        let fetchReguest: NSFetchRequest<User> = User.fetchRequest()
        do {
            let users = try viewContex.fetch(fetchReguest)
            for user in users {
                if user.email == email && user.password == password {
                    return user
                }
            }
            
        } catch let error {
            print("Failed to fetch data", error)
        }
        return nil
    }
    
    func saveCurrentUser(user: User) {
        cleanCurrentUser()
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "CurrentUser", in: viewContex) else { return }
        let currentUser = NSManagedObject(entity: entityDescription, insertInto: viewContex) as! CurrentUser
        currentUser.user = user
        saveContext()
    }
    
    private func cleanCurrentUser() {
        let fetchReguest: NSFetchRequest<CurrentUser> = CurrentUser.fetchRequest()
        do {
            let currentUsers = try viewContex.fetch(fetchReguest)
            for user in currentUsers {
                viewContex.delete(user)
            }
        } catch let error {
            print("Failed to fetch data", error)
        }
    }
    
    func getCurrentUser() -> CurrentUser? {
        let fetchReguest: NSFetchRequest<CurrentUser> = CurrentUser.fetchRequest()
        do {
            let currentUsers = try viewContex.fetch(fetchReguest)
            return currentUsers[0]
        } catch let error {
            print("Failed to fetch data", error)
            return nil
        }
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
