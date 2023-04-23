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
    
    func removeMovieFromLiked(id: Int, user: UserRealm) {
        if let movie = user.likeMovies.filter("id == \(id)").first {
            if let index = user.likeMovies.index(of: movie) {
                try! realm.write {
                    user.likeMovies.remove(at: index)
                }
            }
        }
    }
    
    
    func moveRecentMovieToTop(user: UserRealm, movieId: Int) {
        guard let movieIndex = user.recentMovies.firstIndex(where: { $0.id == movieId }) else { return }
        let movie = user.recentMovies[movieIndex]
        user.recentMovies.remove(at: movieIndex)
        user.recentMovies.insert(movie, at: 0)
    }

    func hasRecentMovie(withId movieId: Int, in user: UserRealm) -> Bool {
        for movie in user.recentMovies {
            if movie.id == movieId {
                return true
            }
        }
        return false
    }

    func categoryMovieFilter(category: String, movies: [MovieRealm]) -> [MovieRealm] {
        let filteredMovies = movies.filter { $0.category == category }
        return filteredMovies
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
