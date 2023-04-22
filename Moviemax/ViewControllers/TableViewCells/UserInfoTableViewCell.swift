//
//  UserInfoTableViewCell.swift
//  Moviemax
//
//  Created by Evgeny on 04.04.2023.
//

import UIKit

final class UserInfoTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    private let userIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 28
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let userFullNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = UIColor(named: "TextTitleColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
   
    private let userNickNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 0.4, green: 0.439, blue: 0.478, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
        
    // MARK: - Public methods
    
    func configureCell(currentUser: UserRealm?) {
        configureConstraints()
        backgroundColor = UIColor(named: "BackgroundScreenColor")
        userFullNameLabel.text = "\(currentUser?.name ?? "") \(currentUser?.secondName ?? "")"
        userNickNameLabel.text = currentUser?.email
        if let photoData = currentUser?.photo {
            userIconImageView.image = UIImage(data: photoData)
        } else {
            userIconImageView.image = UIImage(named: "User-photo")
        }
        selectionStyle = .none
    }

    // MARK: - Private methods
    
    private func configureConstraints() {
        addSubview(userIconImageView)
        addSubview(userFullNameLabel)
        addSubview(userNickNameLabel)
        
        NSLayoutConstraint.activate([
            userIconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            userIconImageView.topAnchor.constraint(equalTo: topAnchor),
            userIconImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            userIconImageView.heightAnchor.constraint(equalToConstant: 56),
            userIconImageView.widthAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            userFullNameLabel.leadingAnchor.constraint(equalTo: userIconImageView.trailingAnchor, constant: 12),
            userFullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            userFullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            userNickNameLabel.leadingAnchor.constraint(equalTo: userIconImageView.trailingAnchor, constant: 12),
            userNickNameLabel.topAnchor.constraint(equalTo: userFullNameLabel.bottomAnchor, constant: 2),
            userNickNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            userNickNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
}
