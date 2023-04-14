//
//  SearchView.swift
//  Moviemax
//
//  Created by Лаванда on 06.04.2023.
//

import UIKit

final class SearchView: UIView {
    
    let categoryCollection = CategoryCollectionView()
    let categoryImage = CategoryImageViewController()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundImage = UIImage()
        searchBar.setImage(UIImage(named: "Search"), for: .search, state: .normal)
        searchBar.searchTextField.backgroundColor = UIColor(named: "BackgroundScreenColor")
        searchBar.placeholder = "Search Movies and TV shows"
        return searchBar
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "close"), for: .normal)
        return button
    }()
    
    private lazy var filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "filter"), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    @objc func buttonTapped() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.message = "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
        
        let buttonClose = UIButton(frame: CGRect(x: 20, y: 20, width: 12, height: 12))
        buttonClose.setImage(UIImage(named: "close"), for: .normal)
        buttonClose.addTarget(self, action: #selector(closeFilter), for: .touchUpInside)
        
        let labelFilter = UILabel(frame: CGRect(x: 40, y: 14, width: 50, height: 26))
        labelFilter.text = "Filter"
        labelFilter.textAlignment = .center
        labelFilter.textColor = .black
        labelFilter.font = Resources.Fonts.plusJakartaSansSemiBold(with: 18)
        
        let buttonRecent = UIButton(frame: CGRect(x: 256, y: 14, width: 104, height: 24))
        buttonRecent.setTitle("Recent Filter", for: .normal)
        buttonRecent.setTitleColor(UIColor(named: "BlueButtonColor"), for: .normal)
        buttonRecent.addTarget(self, action: #selector(recentFilter), for: .touchUpInside)
        buttonRecent.titleLabel?.font = Resources.Fonts.plusJakartaSansSemiBold(with: 14)
        
        let labelCategoies = UILabel(frame: CGRect(x: 20, y: 44, width: 105, height: 26))
        labelCategoies.text = "Categories"
        labelCategoies.textAlignment = .center
        labelCategoies.textColor = .black
        labelCategoies.font = Resources.Fonts.plusJakartaSansSemiBold(with: 16)
        
        let labelStarRaiting = UILabel(frame: CGRect(x: 20, y: 180, width: 105, height: 26))
        labelStarRaiting.text = "Star Raiting"
        labelStarRaiting.textAlignment = .center
        labelStarRaiting.textColor = .black
        labelStarRaiting.font = Resources.Fonts.plusJakartaSansSemiBold(with: 16)
        
        let buttonApplyFilter: UIButton = {
            let button = UIButton(frame: CGRect(x: 30, y: 320, width: 300, height: 50))
            button.layer.cornerRadius = 17
            button.setTitle("Apply Filters", for: .normal)
            button.titleLabel?.font = UIFont(name: "PlusJakartaSansRoman-SemiBold", size: 16)
            button.backgroundColor = UIColor(named: "BlueButtonColor")
            button.setTitleColor(UIColor.white, for: .normal)
            button.addTarget(self, action: #selector(applyFilter), for: .touchUpInside)
            return button
        }()
        alert.view.backgroundColor = .white
        alert.view.addSubview(labelFilter)
        alert.view.addSubview(buttonClose)
        alert.view.addSubview(buttonRecent)
        alert.view.addSubview(labelCategoies)
        alert.view.addSubview(categoryCollection)
        alert.view.addSubview(categoryImage)
        alert.view.addSubview(labelStarRaiting)
        alert.view.addSubview(buttonApplyFilter)
                
        categoryCollection.translatesAutoresizingMaskIntoConstraints = false
        categoryCollection.backgroundColor = UIColor.clear

        categoryCollection.collectionLayout.scrollDirection = .vertical
        categoryCollection.collectionLayout.minimumInteritemSpacing = 10
        categoryCollection.collectionLayout.minimumLineSpacing = 10
        categoryCollection.collectionLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        categoryCollection.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor, constant: 25).isActive = true
        categoryCollection.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor, constant: -10).isActive = true
        categoryCollection.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 80).isActive = true
        categoryCollection.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -220).isActive = true
        
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        categoryImage.backgroundColor = UIColor.clear
        categoryImage.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor, constant: 30).isActive = true
        categoryImage.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor, constant: -30).isActive = true
        categoryImage.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 210).isActive = true
        categoryImage.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -90).isActive = true


        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true)

    }
    @objc func closeFilter () {
        print("1")
    }
    
    @objc func recentFilter () {
        print("2")
    }
    
    @objc func applyFilter () {
        print("3")
    }
    
    
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
}

