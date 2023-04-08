//
//  MoviesLargeCollectionView.swift
//  Moviemax
//
//  Created by Лаванда on 07.04.2023.
//

import UIKit

final class MoviesLargeCollectionView: UICollectionView, UICollectionViewDelegate {
    
    private let cellId = "cell"
    
    let collectionLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        setDelegate()
        collectionLayout.sectionInset = UIEdgeInsets(top: 100, left: 20, bottom: 20, right: 20)
        collectionLayout.scrollDirection = .vertical
        collectionLayout.itemSize = CGSize(width: frame.width, height: 160)
        collectionLayout.minimumLineSpacing = 24
        register(MovieLargeCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDelegate() {
        dataSource = self
        delegate = self
    }
    
}

//MARK: UICollectionViewDataSource

extension MoviesLargeCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? MovieLargeCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //           что будет при нажатии на ячейку
    }
}


