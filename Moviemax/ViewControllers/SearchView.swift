//
//  SearchView.swift
//  Moviemax
//
//  Created by Лаванда on 06.04.2023.
//

import UIKit

final class SearchView: UIView {
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundImage = UIImage()
        searchBar.setImage(UIImage(named: "Search"), for: .search, state: .normal)
        searchBar.searchTextField.backgroundColor = UIColor(named: "BackgroundScreenColor")
        searchBar.placeholder = "Search Movies and TV shows"
        searchBar.searchTextField.clearButtonMode = .never
        return searchBar
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "close"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "filter"), for: .normal)
        button.addTarget(self, action: #selector(filterButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 24
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: "BlueButtonColor")?.cgColor
        addViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        backgroundColor = UIColor(named: "BackgroundScreenColor")
        addSubview(searchBar)
        addSubview(closeButton)
        addSubview(filterButton)
    }
    
    private func setConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            searchBar.centerYAnchor.constraint(equalTo: centerYAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            
            closeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            closeButton.leadingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: 5),
            
            filterButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            filterButton.leadingAnchor.constraint(equalTo: closeButton.trailingAnchor, constant: 22),
            filterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    @objc private func closeButtonPressed() {
        searchBar.searchTextField.text = ""
    }
    
    @objc private func filterButtonPressed() {
    }
}
