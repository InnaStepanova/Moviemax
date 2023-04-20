//
//  LikeButton.swift
//  Moviemax
//
//  Created by Лаванда on 05.04.2023.
//

import UIKit

final class LikeButton: UIButton {
    
    private var likeMovies = StorageManader.shared.getCurrentUser()?.likeMovies
    
    var isFavorite: Bool = false
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        if isFavorite {
            setImage(UIImage(named: "heart_fill"), for: .normal)
        } else {
            setImage(UIImage(named: "heart"), for: .normal)
            tintColor = .gray
        }
        addTarget(self, action: #selector(buttonTapped(_ :)), for: .touchUpInside)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 20),
            widthAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        isFavorite.toggle()
        if isFavorite {
            setImage(UIImage(named: "heart_fill"), for: .normal)
            
            guard let currentUser = StorageManader.shared.getCurrentUser() else {return}
            let movies = currentUser.likeMovies
            for movie in movies {
                if movie.id == Double(sender.tag) {
                    return
                }
            }
            NetworkManager.shared.getMovieDetail(id: sender.tag) { result in
                switch result {
                case .success(let movieDetail):
                    DispatchQueue.main.async {
                        print("LIKEBUTTONPRESSED - \(movieDetail), tag - \(sender.tag)")
                        let movie = MovieData(context: StorageManader.shared.viewContex)
                        movie.id = Double(sender.tag)
                        movie.isLike = true
                        movie.name = movieDetail.originalTitle
                        movie.imageUrl = movieDetail.posterPath
                        movie.date = movieDetail.releaseDate
                        movie.long = String(movieDetail.runtime ?? 0)
                        movie.category = movieDetail.genres?.first?.name
                        currentUser.addToMovies(movie)
                        StorageManader.shared.saveContext()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        } else {
            setImage(UIImage(named: "heart"), for: .normal)
            tintColor = .gray
            
            guard let currentUser = StorageManader.shared.getCurrentUser() else {return}
            let movies = currentUser.likeMovies
            for movie in movies {
                if movie.id == Double(sender.tag) {
                    movie.isLike = false
                    StorageManader.shared.saveContext()
                }
            }
        }
    }
    
    func isLike(id: Int) {
        guard let likeMovies = StorageManader.shared.getCurrentUser()?.likeMovies else {return}
        for movie in likeMovies {
            if movie.id == Double(id) {
                isFavorite = true
                configure()
            }
        }
    }
}

