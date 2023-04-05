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
    
    private lazy var titleLabel: UILabel = {
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
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "DriftingHome")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    private lazy var filmLabel: UILabel = {
        let label = UILabel()
        label.text = "Drifting Home"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var dateImage: UIImageView = {
        let image = UIImageView.dateImage
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var genreImage: UIImageView = {
        let image = UIImageView.genreImage
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()
    
    private lazy var timeImage: UIImageView = {
        let image = UIImageView.timeImage
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel.hintLabel
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = "120min    "
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel.hintLabel
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = "24 Feb 2022   "
        return label
    }()
    
    private lazy var genreLabel: UILabel = {
        let label = UILabel.hintLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Action    "
        return label
    }()
    
    private lazy var starImage: UIImageView = {
        let image = UIImageView.starImage
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()
        
    
    private lazy var starStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var textStoryLabel: UILabel = {
       let label = UILabel()
        label.text = "Story Line"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 5
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var castLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 5
        label.text = "Cast and Crew"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
        view.addSubview(stackView)
        view.addSubview(starStackView)
        view.addSubview(textStoryLabel)
        view.addSubview(castLabel)
        stackView.addArrangedSubview(dateImage)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(timeImage)
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(genreImage)
        stackView.addArrangedSubview(genreLabel)
        starStackView.addArrangedSubview(starImage)
        starStackView.addArrangedSubview(starImage)
        starStackView.addArrangedSubview(starImage)
        starStackView.addArrangedSubview(starImage)
        starStackView.addArrangedSubview(starImage)


        

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
            
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: filmLabel.bottomAnchor, constant: 10),
            
            starStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            starStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            
            textStoryLabel.topAnchor.constraint(equalTo: starStackView.bottomAnchor, constant: 5),
            textStoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            textLabel.topAnchor.constraint(equalTo: textStoryLabel.topAnchor, constant: 30),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            castLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20),
            castLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            
    ])
    }
}

