//
//  SearchViewController.swift
//  Moviemax
//
//  Created by Лаванда on 06.04.2023.
//

import UIKit

final class SearchViewController: UIViewController {
    
    private lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.text = "Search"
        label.font = Resources.Fonts.plusJakartaSansBold(with: 18)
        return label
    }()
    
    private lazy var searchView = SearchView()
    
    private lazy var categoryView = CategoryCollectionView()
    
    private lazy var moviesCollection = MoviesLargeCollectionView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        setConstraints()
    }
    
    private func addViews() {
        view.addSubview(searchLabel)
        view.addSubview(searchView)
        view.addSubview(categoryView)
        view.addSubview(moviesCollection)
    }
    
    private func setConstraints() {
        searchLabel.translatesAutoresizingMaskIntoConstraints = false
        searchView.translatesAutoresizingMaskIntoConstraints = false
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        moviesCollection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 63),
            
            searchView.topAnchor.constraint(equalTo: searchLabel.bottomAnchor, constant: 35),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            searchView.heightAnchor.constraint(equalToConstant: 52),
            
            categoryView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 24),
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
