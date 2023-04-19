//
//  User+CoreDataProperties.swift
//  Moviemax
//
//  Created by Лаванда on 19.04.2023.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var currentUser: Bool
    @NSManaged public var dateOfBrith: Date?
    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var gender: String?
    @NSManaged public var lastName: String?
    @NSManaged public var location: String?
    @NSManaged public var password: String?
    @NSManaged public var photo: Data?
    @NSManaged public var movies: NSSet?

    public var likeMovies: [MovieData] {
        let movies = movies as? Set<MovieData> ?? []
        var likes: [MovieData] = []
        for movie in movies {
            if movie.isLike {
                likes.append(movie)
            }
        }
        return likes
    }
    
    public var recentMovies: [MovieData] {
        let movies = movies as? Set<MovieData> ?? []
        var recent: [MovieData] = []
        for movie in movies {
            if movie.isRecent {
                recent.append(movie)
            }
        }
        return recent
    }
}

// MARK: Generated accessors for movies
extension User {

    @objc(addMoviesObject:)
    @NSManaged public func addToMovies(_ value: MovieData)

    @objc(removeMoviesObject:)
    @NSManaged public func removeFromMovies(_ value: MovieData)

    @objc(addMovies:)
    @NSManaged public func addToMovies(_ values: NSSet)

    @objc(removeMovies:)
    @NSManaged public func removeFromMovies(_ values: NSSet)

}

extension User : Identifiable {

}
