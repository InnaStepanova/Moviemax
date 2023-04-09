//
//  MovieDetail.swift
//  Moviemax
//
//  Created by Николай on 04.04.2023.
//

import Foundation
import UIKit

class MovieDetail: UIViewController {
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "BackButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Movie Detail"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "heart"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    let filmLabel: UILabel = {
        let label = UILabel()
        label.text = "Luck"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let textLabel: UILabel = {
       let label = UILabel()
        label.text = "Text"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundScreenColor")
        setupViews()
        setContraints()
    }
    
    private func setupViews () {
        view.addSubview(likeButton)
        view.addSubview(titleLabel)
        view.addSubview(backButton)
        view.addSubview(image)
        view.addSubview(textLabel)
        view.addSubview(filmLabel)
        
    }
    
    //функция для добавления в избранное
    @objc func likeButtonPressed () {
        likeButton.setImage(UIImage(named: "heart_fill"), for: .normal)
    }
    
    //фунция для перехода в другой VC
    @objc func backButtonPressed () {
        
    }
    
}

extension MovieDetail {
    func setContraints () {
        NSLayoutConstraint.activate([
            likeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 31),
            likeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 31),
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            image.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            image.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 300),
            image.widthAnchor.constraint(equalToConstant: 250),
            
            filmLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5),
            filmLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),

            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            textLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 210),
    ])
    }
}

