//
//  MovieData+CoreDataProperties.swift
//  Moviemax
//
//  Created by Лаванда on 19.04.2023.
//
//

import Foundation
import CoreData


extension MovieData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieData> {
        return NSFetchRequest<MovieData>(entityName: "MovieData")
    }

    @NSManaged public var category: String?
    @NSManaged public var date: String?
    @NSManaged public var id: Double
    @NSManaged public var imageUrl: String?
    @NSManaged public var long: String?
    @NSManaged public var name: String?
    @NSManaged public var isRecent: Bool
    @NSManaged public var isLike: Bool
    @NSManaged public var user: User?

}

extension MovieData : Identifiable {

}
