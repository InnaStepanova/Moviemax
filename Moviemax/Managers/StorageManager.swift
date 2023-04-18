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
    
    func editUser(user: User?, completion:(User?) -> Void) {
        completion(user)
        saveContext()
    }
    
    func saveCurrentUser(user: User) {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: viewContex) else { return }
        var currentUser = NSManagedObject(entity: entityDescription, insertInto: viewContex) as! User
        currentUser = user
        saveContext()
    }
    
    func addDateOfBrith(user: User?, date: Date) {
        if let user = user {
            user.dateOfBrith = date
            saveCurrentUser(user: user)
            saveContext()
        }
    }
    
//    private func cleanCurrentUser() {
//        let fetchReguest: NSFetchRequest<CurrentUser> = CurrentUser.fetchRequest()
//        do {
//            let currentUsers = try viewContex.fetch(fetchReguest)
//            for user in currentUsers {
//                viewContex.delete(user)
//            }
//        } catch let error {
//            print("Failed to fetch data", error)
//        }
//    }
    
    func getCurrentUser() -> User? {
        let fetchReguest: NSFetchRequest<User> = User.fetchRequest()
        do {
            let users = try viewContex.fetch(fetchReguest)
            for user in users {
                if user.currentUser {
                    return user
                }
            }
        } catch let error {
            print("Failed to fetch data", error)
        }
        return nil
    }
    
    func addMovie(completion: (MovieData) -> Void) {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "MovieData", in: viewContex) else { return }
        let movie = NSManagedObject(entity: entityDescription, insertInto: viewContex) as! MovieData
        completion(movie)
        saveContext()
    }
    
    func getMovies() -> [MovieData] {
        let fetchReguest: NSFetchRequest<MovieData> = MovieData.fetchRequest()
        do {
            let movies = try viewContex.fetch(fetchReguest)
            return movies
        } catch let error {
            print("Failed to fetch data", error)
            return []
        }
    }
    
    func deleteMovie(_ movie: MovieData) {
        viewContex.delete(movie)
        saveContext()
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
