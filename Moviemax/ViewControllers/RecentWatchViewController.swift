//
//  RecentWatchViewController.swift
//  Moviemax
//
//  Created by Лаванда on 08.04.2023.
//

import UIKit

final class RecentWatchViewController: UIViewController, UICollectionViewDelegate {
    
    private lazy var recentWatchLabel: UILabel = {
        let label = UILabel()
        label.text = "Recent Watch"
        label.font = Resources.Fonts.plusJakartaSansBold(with: 18)
        return label
    }()
    
    private lazy var categoryView = CategoryCollectionView()
    
    private lazy var moviesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.bounds.width, height: 160)
        layout.minimumLineSpacing = 24
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInsetAdjustmentBehavior = .scrollableAxes
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(MovieLargeCell.self, forCellWithReuseIdentifier: "MovieLargeCell")
        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(named: "BackgroundScreenColor")
        addViews()
        setConstraints()
    }
    
    private func addViews() {
        view.addSubview(recentWatchLabel)
        view.addSubview(categoryView)
        view.addSubview(moviesCollection)
    }
    
    private func setConstraints() {
        recentWatchLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        moviesCollection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            recentWatchLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recentWatchLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 63),
            
            categoryView.topAnchor.constraint(equalTo: recentWatchLabel.bottomAnchor, constant: 24),
            categoryView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            categoryView.heightAnchor.constraint(equalToConstant: 34),
            categoryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            moviesCollection.topAnchor.constraint(equalTo: categoryView.bottomAnchor, constant: 24),
            moviesCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            moviesCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
extension RecentWatchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieLargeCell", for: indexPath) as! MovieLargeCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetailVC = MovieDetail()
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}

