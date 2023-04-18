//
//  ViewModel.swift
//  Moviemax
//
//  Created by Николай Игнатов on 18.04.2023.
//

import Foundation

struct MovieViewModel {
    let id: Int
    let posterURL: String
    let title: String
    let runtime: String
    let reliseDate: String
    let genre: String
    let overview: String
    let voteAverage: Double
    var crew: [Crew]?
}
