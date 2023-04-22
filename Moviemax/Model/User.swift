//
//  File.swift
//  Moviemax
//
//  Created by Лаванда on 20.04.2023.
//

import RealmSwift

class UserRealm: Object {
    @objc dynamic var name = ""
    @objc dynamic var secondName = ""
    @objc dynamic var email = ""
    @objc dynamic var password = ""
    @objc dynamic var isCurrent = false
    @objc dynamic var photo: Data? = nil
    @objc dynamic var dateOfBrith: String? = nil
    @objc dynamic var location: String? = nil
    @objc dynamic var gender: String? = nil
    let likeMovies = List<MovieRealm>()
    let recentMovies = List<MovieRealm>()
}

class MovieRealm: Object {
    @objc dynamic var name = ""
    @objc dynamic var category = ""
    @objc dynamic var date = ""
    @objc dynamic var id = 0
    @objc dynamic var imageUrl = ""
    @objc dynamic var long = ""
}
