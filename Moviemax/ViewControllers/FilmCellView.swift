//
//  FilmCellView.swift
//  Moviemax
//
//  Created by user on 7.04.23.
//

import UIKit

class FilmCellView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var popularTV: [Movie] = []
    var delegate: FilmCellViewDelegate!

    private lazy var collectionView: WheelCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 400)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        let collectionView = WheelCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FilmCell.self, forCellWithReuseIdentifier: "FilmCell")
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        getPopularTV()
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
        return popularTV.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmCell", for: indexPath) as! FilmCell
        let movie = popularTV[indexPath.item]
        cell.set(movieId: movie.id)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("CELL TAPPED")
        let movieDetail = MovieDetail()

        let movieId = popularTV[indexPath.item].id
        
        if let window = UIApplication.shared.windows.first(where: {$0.isKeyWindow}) {
            if let navigationController = window.rootViewController as? UINavigationController {
                navigationController.pushViewController(movieDetail, animated: true)
            }
        }
    }
    
    func getPopularTV() {
        NetworkManager.shared.getPopularTV { result in
            switch result {
            case .success(let films):
            self.popularTV = films
            case .failure(let error):
                print(error)
            }
        }
    }
    
}


class WheelCollectionView: UICollectionView {

    let centralCellScale: CGFloat = 1.0 // масштаб центральной ячейки
    let cellOffset: CGFloat = 10.0 // смещение ячеек от центра

    override func layoutSubviews() {
        super.layoutSubviews()

        let centerX = self.contentOffset.x + 300

        for cell in self.visibleCells {
            let distanceFromCenter = abs(centerX - cell.center.x)
            let distanceFromCenter1 = centerX - cell.center.x
            let offset = distanceFromCenter / self.bounds.width
            let offset1 = distanceFromCenter1 / self.bounds.width
            let scaleFactor = max(centralCellScale - offset, 0.8)
            let translateY = (1 - scaleFactor) * cellOffset
            let angle = -offset1 * .pi / 6

            // Масштабирование и смещение ячейки
            let transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
                .translatedBy(x: 0, y: translateY)
                .rotated(by: angle)
            cell.transform = transform
        }
    }
}

