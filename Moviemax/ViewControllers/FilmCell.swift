//
//  MainFilmCell.swift
//  Moviemax
//
//  Created by user on 7.04.23.
//

import UIKit

final class FilmCell: UICollectionViewCell {

    private let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "DriftingHome")
        return imageView
    }()
    
    private lazy var movieName: UILabel = {
        let label = UILabel()
        label.text = "Drifting Home"
        label.font = Resources.Fonts.plusJakartaSansBold(with: 18)
        label.textColor = .white
        return label
    }()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "  Action  "
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        label.layer.cornerRadius = 9
        label.clipsToBounds = true
        label.font = Resources.Fonts.plusJakartaSansMedium(with: 18)
        label.textColor = .white
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(movieId: Int) {
        NetworkManager.shared.getTVDetail(id: movieId) { result in
            switch result {
            case .success(let movie):
                print("ЭТО TV \(movie)")
                guard let url = movie.posterPath else { return }
                
                NetworkManager.shared.downloadImage(path: url) { image in
                    guard let image else {
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self.movieImage.image = image
                        self.movieName.text = movie.originalTitle
                        self.categoryLabel.text = movie.genres?[0].name
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func setupViews() {
        addSubview(movieImage)
        addSubview(movieName)
        addSubview(categoryLabel)
        setConstraint()
    }
    
    private func setConstraint() {
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        movieName.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            categoryLabel.bottomAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: -110),

            movieName.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 5),
            movieName.leadingAnchor.constraint(equalTo: movieImage.leadingAnchor, constant: 15),
            
        ])
    }
}
