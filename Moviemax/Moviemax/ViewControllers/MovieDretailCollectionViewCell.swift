//
//  MovieDretailCollectionViewCell.swift
//  Moviemax
//
//  Created by Николай on 06.04.2023.
//

import UIKit
class CustomCollectionViewCell: UICollectionViewCell {
    
        
        let imageView = UIImageView()
        let titleLabel = UILabel()
        let subtitleLabel = UILabel()

        override init(frame: CGRect) {
            super.init(frame: frame)
            
            // Добавляем subviews и настраиваем их
            
            // Добавляем UIImageView
            imageView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(imageView)
            
            // Добавляем titleLabel
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
            addSubview(titleLabel)
            
            // Добавляем subtitleLabel
            subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
            subtitleLabel.font = UIFont.systemFont(ofSize: 14)
            subtitleLabel.textColor = UIColor.gray
            addSubview(subtitleLabel)
            
            // Настраиваем constraints

            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: topAnchor),
                imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
                imageView.heightAnchor.constraint(equalToConstant: 50),
                imageView.widthAnchor.constraint(equalToConstant: 50),
                
                titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5),
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                subtitleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 2),
                subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
                subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }


