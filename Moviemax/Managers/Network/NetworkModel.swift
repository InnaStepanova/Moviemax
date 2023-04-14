//
//  NetworkModel.swift
//  Moviemax
//
//  Created by Николай Игнатов on 13.04.2023.
//

import Foundation

struct NetworkMovieResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
}

struct Movies: Codable {
    let results: [MovieDetailData]
}

struct MovieDetailData: Codable {
    let genres: [Genre]?
    let id: Int?
    let originalTitle: String?
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
    let runtime: Int?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case id
        case genres
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case runtime
        case voteAverage = "vote_average"
    }
}

struct Genre: Codable {
    let id: Int?
    let name: String?
}

struct MovieCrew: Codable {
    let id: Int?
    let crew: [Crew]?
}

struct Crew: Codable {
    let name: String
    let job: String
    let profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case name, job
        case profilePath = "profile_path"
    }
}
