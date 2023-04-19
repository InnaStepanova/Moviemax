//
//  MovieLargeCell.swift
//  Moviemax
//
//  Created by Лаванда on 04.04.2023.
//

import UIKit

final class MovieLargeCell: UICollectionViewCell {
    
    var movie: MovieData?
    
    private lazy var likeButton = LikeButton(movie: movie)
    
    private lazy var movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.image = UIImage(named: "DriftingHome")
        return imageView
    }()
    
    private lazy var movieName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.text = "Drifting Home"
        label.font = Resources.Fonts.plusJakartaSansBold(with: 18)
        return label
    }()
    
    private lazy var timeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "time")
        return imageView
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "148 Minutes"
        label.font = Resources.Fonts.montserratMedium(with: 12)
        label.textColor = .gray
        return label
    }()
    
    private lazy var dateIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "date")
        return imageView
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "17 Sep 2021"
        label.font = Resources.Fonts.montserratMedium(with: 12)
        label.textColor = .gray
        return label
    }()
    
    private lazy var movieIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "movie")
        return imageView
    }()
    
    private lazy var watchNowButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: "BlueButtonColor")
        button.setTitle("   Watch now   ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font  = Resources.Fonts.montserratMedium(with: 12)
        button.layer.cornerRadius = 6
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "BackgroundScreenColor")
        addViews()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: MovieViewModel) {
        
        let movie = MovieData(context: StorageManader.shared.viewContex)
        movie.id = Double(model.id)
        movie.name = model.title
        movie.imageUrl = model.posterURL
        movie.date = model.reliseDate
        movie.long = model.runtime
        movie.category = model.genre
        
        self.movie = movie
        
        let url = model.posterURL
        NetworkManager.shared.downloadImage(path: url) { [weak self] image in
           DispatchQueue.main.async {
               self?.movieImage.image = image
           }
        }
        self.movieName.text = model.title
        self.dateLabel.text = model.reliseDate
        self.timeLabel.text = model.runtime
        self.watchNowButton.setTitle(model.genre, for: .normal)
        }
    
    func set(movie: MovieData) {
        self.movie = movie
        guard let url = movie.imageUrl else {return}
        NetworkManager.shared.downloadImage(path: url) { [weak self] image in
           DispatchQueue.main.async {
               self?.movieImage.image = image
           }
        }
        self.movieName.text = movie.name
        self.dateLabel.text = movie.date
        self.timeLabel.text = movie.long
        self.watchNowButton.setTitle(movie.category, for: .normal)
    }
    
    private func addViews() {
        addSubview(movieImage)
        addSubview(movieName)
        addSubview(timeIcon)
        addSubview(timeLabel)
        addSubview(dateIcon)
        addSubview(dateLabel)
        addSubview(movieIcon)
        addSubview(watchNowButton)
        addSubview(likeButton)
    }
    
    private func setConstraint() {
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        movieName.translatesAutoresizingMaskIntoConstraints = false
        timeIcon.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        dateIcon.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        movieIcon.translatesAutoresizingMaskIntoConstraints = false
        watchNowButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieImage.heightAnchor.constraint(equalToConstant: 160),
            movieImage.widthAnchor.constraint(equalToConstant: 120),
            movieImage.topAnchor.constraint(equalTo: topAnchor),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            movieImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            movieName.topAnchor.constraint(equalTo: movieImage.topAnchor),
            movieName.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 15),
            movieName.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor, constant: -10),
            
            timeIcon.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 12),
            timeIcon.leadingAnchor.constraint(equalTo: movieName.leadingAnchor),
            
            timeLabel.centerYAnchor.constraint(equalTo: timeIcon.centerYAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: timeIcon.trailingAnchor, constant: 5),
            
            dateIcon.topAnchor.constraint(equalTo: timeIcon.bottomAnchor, constant: 12),
            dateIcon.leadingAnchor.constraint(equalTo: movieName.leadingAnchor),
            
            dateLabel.centerYAnchor.constraint(equalTo: dateIcon.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: dateIcon.trailingAnchor, constant: 5),
            
            movieIcon.topAnchor.constraint(equalTo: dateIcon.bottomAnchor, constant: 16),
            movieIcon.leadingAnchor.constraint(equalTo: movieName.leadingAnchor),
            
            watchNowButton.centerYAnchor.constraint(equalTo: movieIcon.centerYAnchor),
            watchNowButton.leadingAnchor.constraint(equalTo: movieIcon.trailingAnchor, constant: 5),
            
            likeButton.centerYAnchor.constraint(equalTo: movieName.centerYAnchor),
            likeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28)
        ])
    }
}
