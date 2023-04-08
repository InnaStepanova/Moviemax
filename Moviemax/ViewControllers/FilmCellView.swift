//
//  FilmCellView.swift
//  Moviemax
//
//  Created by user on 7.04.23.
//

import UIKit

class FilmCellView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 400)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(named: "BackgroundScreenColor")
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FilmCell.self, forCellWithReuseIdentifier: "FilmCell")
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmCell", for: indexPath) as! FilmCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // Угол поворота в градусах
        let rotationAngleDegrees: CGFloat = 45.0
        // Угол поворота в радианах
        let rotationAngleRadians = rotationAngleDegrees * .pi / 180.0
        
        // Начальное значение для анимации
        cell.alpha = 0.0
        cell.transform = CGAffineTransform(rotationAngle: rotationAngleRadians)
        
        // Анимация появления ячейки
        UIView.animate(withDuration: 0.5) {
            cell.alpha = 1.0
            cell.transform = .identity
        }
        
        // Возвращаем предыдущую ячейку в начальное состояние
        if let previousCell = collectionView.cellForItem(at: IndexPath(row: indexPath.row - 1, section: indexPath.section)) {
            previousCell.alpha = 1.0
            previousCell.transform = .identity
        }
    }

    
    
}
