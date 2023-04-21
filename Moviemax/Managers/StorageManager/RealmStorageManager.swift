//
//  RealmStorageManager.swift
//  Moviemax
//
//  Created by Лаванда on 20.04.2023.
//

import RealmSwift

class RealmStorageManager {
    static let shared = RealmStorageManager()
    private init() {}
    
    let realm = try! Realm()
    
    func like(user: UserRealm, movie: MovieRealm) {
        try! realm.write {
            user.likeMovies.insert(movie, at: 0)
        }
    }
    
    func deleteLike(user: UserRealm, movie: MovieRealm) {
        try! realm.write {
            if let index = user.likeMovies.firstIndex(of: movie) {
                user.likeMovies.remove(at: index)
            }
        }
    }
    
    func recent(user: UserRealm, movie: MovieRealm) {
        try! realm.write {
            user.recentMovies.insert(movie, at: 0)
        }
    }
    
    func saveUser (user: UserRealm) {
        try! realm.write {
            user.isCurrent = true
            realm.add(user)
        }
    }
    
    func getCurrentUser() -> UserRealm? {
        let currentUsers = realm.objects(UserRealm.self).filter("isCurrent == true")
        if currentUsers.count == 0 {
            return nil
        }
        return currentUsers[0]
    }
    
    func findUser(email1: String, password1: String) -> UserRealm? {
        let users = realm.objects(UserRealm.self).filter{ $0.email == email1 && $0.password == password1 }

        if users.count == 0 {
            return nil
        }
        return users[0]
    }
    
    func edit(completion: () -> Void) {
        do {
            try realm.write {
                completion()
            }
        } catch let error {
            print(error)
        }
    }

}
