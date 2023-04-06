//
//  ProbaVC.swift
//  Moviemax
//
//  Created by Лаванда on 06.04.2023.
//

import UIKit

class ProbaVC: UIViewController {
    let cell = MovieLargeCell()
    let littleCell = MovieLittleCell()
    let likeButton = LikeButton()
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        view.addSubview(cell)
        view.addSubview(littleCell)
        view.addSubview(likeButton)
        cell.translatesAutoresizingMaskIntoConstraints = false
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        littleCell.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cell.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cell.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cell.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            likeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            likeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            littleCell.topAnchor.constraint(equalTo: cell.bottomAnchor, constant: 50),
            littleCell.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            littleCell.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}
