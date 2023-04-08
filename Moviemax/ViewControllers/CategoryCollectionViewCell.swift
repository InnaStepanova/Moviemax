//
//  CategoryCollectionViewCell.swift
//  Moviemax
//
//  Created by Лаванда on 06.04.2023.
//
import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    let categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 156.0/255.0, green: 164.0/255.0, blue: 171.0/255.0, alpha: 1)
        label.font = Resources.Fonts.plusJakartaSans(with: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = self.isSelected ? UIColor(named: "BlueButtonColor") : .white
            categoryLabel.textColor = self.isSelected ? .white : UIColor(red: 156.0/255.0, green: 164.0/255.0, blue: 171.0/255.0, alpha: 1)
            layer.borderColor = self.isSelected ? UIColor(named: "BlueButtonColor")?.cgColor : UIColor(red: 156.0/255.0, green: 164.0/255.0, blue: 171.0/255.0, alpha: 1).cgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(categoryLabel)
        layer.cornerRadius = 17
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 156.0/255.0, green: 164.0/255.0, blue: 171.0/255.0, alpha: 1).cgColor
        
        NSLayoutConstraint.activate([
            categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(buttonTitle: String) {
        categoryLabel.text = buttonTitle
    }
}
