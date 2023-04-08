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
        label.font = Resources.Fonts.plusJakartaSansBold(with: Constants.Size.titleLabelSize)
        label.text = "Favorites"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var favoritesList: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.bounds.width, height: Constants.Size.itemSize)
        layout.minimumLineSpacing = Constants.Spacing.minimumLineSpacing
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInsetAdjustmentBehavior = .scrollableAxes
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor(named: "BackgroundColor")
        collectionView.register(MovieLargeCell.self, forCellWithReuseIdentifier: "MovieLargeCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
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
            
            favoritesList.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.Spacing.favoritesListTopSpacing),
            favoritesList.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            favoritesList.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            favoritesList.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieLargeCell", for: indexPath) as? MovieLargeCell else { return UICollectionViewCell() }
        return cell
    }
}

private extension FavoritesViewController {
    enum Constants {
        enum Spacing {
            static let favoritesListTopSpacing: CGFloat = 42
            static let topSpacingForTitle: CGFloat = 30
            static let minimumLineSpacing: CGFloat = 24
        }
        enum Size {
            static let itemSize: CGFloat = 160
            static let titleLabelSize: CGFloat = 18
        }
    }
}
