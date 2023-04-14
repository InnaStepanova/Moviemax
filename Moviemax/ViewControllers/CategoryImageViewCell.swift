//
//  CategoryImageViewCell.swift
//  Moviemax
//
//  Created by Николай on 14.04.2023.
//

import Foundation

import UIKit

final class CategoryImageViewCell: UICollectionViewCell {

    let categoryImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override var isSelected: Bool {
        didSet {
            
            layer.borderColor = self.isSelected ? UIColor(named: "BlueButtonColor")?.cgColor : UIColor.clear.cgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(categoryImage)
        layer.borderWidth = 1
        layer.cornerRadius = 15
        layer.borderColor = UIColor.clear.cgColor
        
        NSLayoutConstraint.activate([
            categoryImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoryImage.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(buttonImage: UIImageView) {
        categoryImage.image = buttonImage.image
    }
}
