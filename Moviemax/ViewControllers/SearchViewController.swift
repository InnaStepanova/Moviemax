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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        setConstraints()
    }
    
    private func addViews() {
        view.addSubview(searchLabel)
        view.addSubview(searchView)
    }
    
    private func setConstraints() {
        searchLabel.translatesAutoresizingMaskIntoConstraints = false
        searchView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 63),
            
            searchView.topAnchor.constraint(equalTo: searchLabel.bottomAnchor, constant: 35),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            searchView.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
}
