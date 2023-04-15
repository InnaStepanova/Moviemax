//
//  LikeButton.swift
//  Moviemax
//
//  Created by Лаванда on 05.04.2023.
//

import UIKit

final class LikeButton: UIButton {
    
    var isFavorite: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setImage(UIImage(named: "heart"), for: .normal)
        addTarget(self, action: #selector(buttonTapped(_ :)), for: .touchUpInside)
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
            setImage(UIImage(named: "heart_fill"), for: .normal)
//            DataManager.shared.save(recipe: recipe)
        } else {
            setImage(UIImage(named: "heart"), for: .normal)
            tintColor = .gray
//            DataManager.shared.delete(recipe: recipe)
        }
    }
    
}
