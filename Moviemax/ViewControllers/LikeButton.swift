//
//  LikeButton.swift
//  Moviemax
//
//  Created by Лаванда on 05.04.2023.
//

import UIKit

final class LikeButton: UIButton {
    
    var isFavorite: Bool = false
    var movie: MovieData?
    var likeMovies = StorageManader.shared.getCurrentUser()!.likeMovies
    
    private lazy var currentUser = StorageManader.shared.getCurrentUser()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    init(movie: MovieData?) {
        super.init(frame: .zero)
        self.movie = movie
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        isLike()
        if isFavorite {
            setImage(UIImage(named: "heart_fill"), for: .normal)
        } else {
            setImage(UIImage(named: "heart"), for: .normal)
            tintColor = .gray
        }
        addTarget(self, action: #selector(buttonTapped(_ :)), for: .touchUpInside)
    }
    
    private func isLike() {
        if let id = self.movie?.id  {
            for movie in likeMovies {
                if movie.id == Double(id) {
                    isFavorite = true
                }
            }
        }
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
            print("Is LIKE BUTTON TAPE - MOVIE \(movie?.name)")
            setImage(UIImage(named: "heart_fill"), for: .normal)
            var likeMovie = MovieData(context: StorageManader.shared.viewContex)
            guard let forceMovie = movie else {return}
            likeMovie = forceMovie
            likeMovie.isLike = true
            currentUser?.addToMovies(likeMovie)
            StorageManader.shared.saveContext()
        } else {
            setImage(UIImage(named: "heart"), for: .normal)
            tintColor = .gray
            guard let forceMovie = movie else {return}
            currentUser?.removeFromMovies(forceMovie)
            StorageManader.shared.saveContext()
        }
    }
}

