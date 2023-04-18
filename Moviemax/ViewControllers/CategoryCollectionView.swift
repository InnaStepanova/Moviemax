//
//  CategoryCollectionView.swift
//  Moviemax
//
//  Created by Лаванда on 06.04.2023.
//

import UIKit

class CategoryCollectionView: UICollectionView {
    
    static var films: String?
    
    var categories  = ["All", "Action", "Adventure", "Mystery", "Fantasy", "Others"]
    
    let collectionLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        setDelegate()
        backgroundColor = UIColor(named: "BackgroundScreenColor")
        collectionLayout.scrollDirection = .horizontal
        showsHorizontalScrollIndicator = false
        selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .left)
        register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCell")
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

extension CategoryCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let category = categories[indexPath.item]
        cell.set(buttonTitle: category)
        let indexPath = IndexPath(arrayLiteral: 0)
        collectionView.reloadItems(at: [indexPath])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        CategoryCollectionView.films = categories[indexPath.row]
    }
}

//MARK: UICollectionViewDelegateFlowLayout

extension CategoryCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let categoryFont = Resources.Fonts.plusJakartaSans(with: 12)
        let categoryAttributes = [NSAttributedString.Key.font : categoryFont]
        let categoryWidth = categories[indexPath.item].size(withAttributes: categoryAttributes).width + 48
        return CGSize(width: categoryWidth, height: 34)
    }
}
