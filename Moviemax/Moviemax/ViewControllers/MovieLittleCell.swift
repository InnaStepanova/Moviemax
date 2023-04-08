//
//  MovieLittleCell.swift
//  Moviemax
//
//  Created by Лаванда on 06.04.2023.
//

import UIKit

final class MovieLittleCell: UICollectionViewCell {
    
    private lazy var likeButton: LikeButton = {
        let button = LikeButton()
        return button
    }()
    
    private lazy var movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
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
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Action"
        label.font = Resources.Fonts.plusJakartaSansMedium(with: 12)
        label.textColor = .gray
        return label
    }()
    
    private lazy var starImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        return imageView
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "4,4"
        label.textColor = UIColor(red: 250.0/255.0, green: 204.0/255.0, blue: 21.0/255.0, alpha: 1)

        label.font = Resources.Fonts.plusJakartaSansSemiBold(with: 12)
        return label
    }()
    
    private lazy var qtyVoiceLabel: UILabel = {
        let label = UILabel()
        label.text = "(52)"
        label.textColor = .gray
        label.font = Resources.Fonts.plusJakartaSansSemiBold(with: 12)
        return label
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
        addSubview(starImage)
        addSubview(likeButton)
        addSubview(ratingLabel)
        addSubview(qtyVoiceLabel)
        addSubview(categoryLabel)
    }
    
    private func setConstraint() {
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        movieName.translatesAutoresizingMaskIntoConstraints = false
        timeIcon.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        starImage.translatesAutoresizingMaskIntoConstraints = false
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        qtyVoiceLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieImage.heightAnchor.constraint(equalToConstant: 80),
            movieImage.widthAnchor.constraint(equalToConstant: 80),
            movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 23),
            movieImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            categoryLabel.topAnchor.constraint(equalTo: movieImage.topAnchor, constant: 5),
            categoryLabel.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 12),
            
            movieName.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 3),
            movieName.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 12),
            
            timeIcon.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 12),
            timeIcon.leadingAnchor.constraint(equalTo: movieName.leadingAnchor),
            
            timeLabel.centerYAnchor.constraint(equalTo: timeIcon.centerYAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: timeIcon.trailingAnchor, constant: 5),
            
            likeButton.topAnchor.constraint(equalTo: movieImage.topAnchor),
            likeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            
            qtyVoiceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            qtyVoiceLabel.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor),
            
            ratingLabel.trailingAnchor.constraint(equalTo: qtyVoiceLabel.leadingAnchor, constant: -3),
            ratingLabel.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor),
            
            starImage.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor),
            starImage.trailingAnchor.constraint(equalTo: ratingLabel.leadingAnchor, constant: -5),
        ])
    }
}
