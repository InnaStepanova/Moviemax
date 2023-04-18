//
//  CategoryImageViewController.swift
//  Moviemax
//
//  Created by Николай on 14.04.2023.
//

import Foundation
import UIKit

class CategoryImageViewController: UICollectionView {
    
    static var stars: Int?
//    static var currentRow = 0
    
    var imageCategories = [UIImageView.star1, UIImageView.stars2, UIImageView.stars3, UIImageView.stars4,UIImageView.star5]
    let collectionLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        setDelegate()
        collectionLayout.minimumInteritemSpacing = 7
        collectionLayout.minimumLineSpacing = 5
        collectionLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

//        backgroundColor = UIColor(named: "BackgroundScreenColor")
        collectionLayout.scrollDirection = .vertical
        showsHorizontalScrollIndicator = false
        selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .left)
        register(CategoryImageViewCell.self, forCellWithReuseIdentifier: "CategoryImageCell")
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

extension CategoryImageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: "CategoryImageCell", for: indexPath) as? CategoryImageViewCell else {
            return UICollectionViewCell()
        }
        
        let category = imageCategories[indexPath.item]
        cell.set(buttonImage: category)
        let indexPath = IndexPath(arrayLiteral: 0)
        collectionView.reloadItems(at: [indexPath])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        CategoryImageViewController.stars = indexPath.row
    }
}

//MARK: UICollectionViewDelegateFlowLayout

extension CategoryImageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Получаем размер картинки из источника данных коллекции, например, массива
        let imageSize = imageCategories[indexPath.item].image?.size
        
        // Создаем кнопку и устанавливаем ее размер в соответствии с размером картинки
        let button = UIButton(type: .system)
        button.setImage(imageCategories[indexPath.item].image, for: .normal)
        button.sizeToFit()
        let buttonSize = button.frame.size
        
        // Возвращаем размер кнопки плюс отступы, если это необходимо
        return CGSize(width: buttonSize.width, height: buttonSize.height)
    }
}
