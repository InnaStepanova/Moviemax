//
//  FilmLargeCell.swift
//  Moviemax
//
//  Created by Лаванда on 04.04.2023.
//

import UIKit

class FilmLargeCell: UICollectionViewCell {
    
    private lazy var movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    
    private lazy var movieName: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var timeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "time")
        return imageView
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var informationStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .leading
        return stackView
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(movieImage)
    }
    private func configure() {
        
    }
    
    private func setConstraint() {
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieImage.heightAnchor.constraint(equalToConstant: 160),
            movieImage.widthAnchor.constraint(equalToConstant: 120),
            movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            movieImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            
        ])
    }
}
