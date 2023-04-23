//
//  FilmCellView.swift
//  Moviemax
//
//  Created by user on 7.04.23.
//

import UIKit

protocol FilmCellViewDelegate: AnyObject {
    func showMovieDetailViewController(with model: Movie)
}

class FilmCellView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private var popularTV: [Movie] = []
    private weak var delegate: FilmCellViewDelegate?
    
    private lazy var collectionView: WheelCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 400)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collectionView = WheelCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(named: "BackgroundColor")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FilmCell.self, forCellWithReuseIdentifier: "FilmCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    // MARK: - Initialize
    
    init(delegate: FilmCellViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        self.getPopularTV()
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func configureView() {
        configureConstraints()
        backgroundColor = UIColor(named: "BackgroundColor")
    }
    
    private func configureConstraints() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Collection View Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularTV.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmCell", for: indexPath) as! FilmCell
        let movie = popularTV[indexPath.item]
        print("Это ТВ \(movie)")
        cell.set(movieId: movie.id)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = popularTV[indexPath.item]
        delegate?.showMovieDetailViewController(with: movie)
    }
    
    func getPopularTV() {
        NetworkManager.shared.getPopularTV { result in
            switch result {
            case .success(let films):
                self.popularTV = films
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}


class WheelCollectionView: UICollectionView {
    
    let centralCellScale: CGFloat = 0.8 // масштаб центральной ячейки
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

