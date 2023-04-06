//
//  MovieDretailCollectionViewCell.swift
//  Moviemax
//
//  Created by Николай on 06.04.2023.
//

import UIKit

class MovieDretailCollectionViewCell: UICollectionViewCell {
    private lazy var nameLabel = UILabel()
    private lazy var nameImage = UIImageView()

    var na: String? {
        didSet {
            nameLabel.text = self.na
            if let image = self.na {
                nameImage.image = UIImage(named: image)
            }
        }
    }
}
