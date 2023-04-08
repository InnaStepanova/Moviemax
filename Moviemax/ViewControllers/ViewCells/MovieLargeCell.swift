//
//  MovieLargeCell.swift
//  Moviemax
//
//  Created by Лаванда on 04.04.2023.
//

import UIKit

final class MovieLargeCell: UICollectionViewCell {
    
    private lazy var likeButton: LikeButton = {
        let button = LikeButton()
        return button
    }()
    
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
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Action"
        label.textColor = .white
        label.font = Resources.Fonts.montserratMedium(with: 12)
        return label
    }()
    
    private lazy var categoryView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "PurpleBackGroundColor")
        view.layer.cornerRadius = 6
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(movieImage)
        addSubview(movieName)
        addSubview(timeIcon)
        addSubview(timeLabel)
        addSubview(dateIcon)
        addSubview(dateLabel)
        addSubview(movieIcon)
        addSubview(likeButton)
        addSubview(categoryView)
        categoryView.addSubview(categoryLabel)
    }
    
    private func setConstraint() {
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        movieName.translatesAutoresizingMaskIntoConstraints = false
        timeIcon.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        dateIcon.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        movieIcon.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieImage.heightAnchor.constraint(equalToConstant: 160),
            movieImage.widthAnchor.constraint(equalToConstant: 120),
            movieImage.topAnchor.constraint(equalTo: topAnchor),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            movieImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            movieName.topAnchor.constraint(equalTo: movieImage.topAnchor),
            movieName.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 15),
            
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
            
            categoryView.centerYAnchor.constraint(equalTo: movieIcon.centerYAnchor),
            categoryView.widthAnchor.constraint(equalToConstant: 65),
            categoryView.heightAnchor.constraint(equalToConstant: 24),
            categoryView.leadingAnchor.constraint(equalTo: movieIcon.trailingAnchor, constant: 6),
            
            categoryLabel.centerYAnchor.constraint(equalTo: movieIcon.centerYAnchor),
            categoryLabel.centerXAnchor.constraint(equalTo: categoryView.centerXAnchor),
            
            likeButton.centerYAnchor.constraint(equalTo: movieName.centerYAnchor),
            likeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28)
        ])
    }
}
