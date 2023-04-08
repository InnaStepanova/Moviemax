//
//  FavoritesViewController.swift
//  Moviemax
//
//  Created by Николай Игнатов on 08.04.2023.
//

import UIKit

final class FavoritesViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.plusJakartaSansBold(with: 18)
        label.text = "Favorites"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var favoritesList: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MovieLargeCell.self, forCellWithReuseIdentifier: "MovieLargeCell")
        collectionView.backgroundColor = UIColor(named: "BackgroundColor")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
//    private var favoritesArray: Array<Any>
    
//    init(favoritesArray: Array<Any>) {
//        self.favoritesArray = favoritesArray
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
        view.addSubview(titleLabel)
        view.addSubview(favoritesList)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.Spacing.topSpacingForTitle),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            favoritesList.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 42),
            favoritesList.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            favoritesList.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            favoritesList.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

private extension FavoritesViewController {
    enum Constants {
        enum Spacing {
            static let favoritesListTopSpacing: CGFloat = 16
            static let topSpacingForTitle: CGFloat = 37
        }
    }
}

extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieLargeCell", for: indexPath) else { return UICollectionViewCell() }
        
        return cell
    }
    

}
