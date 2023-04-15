//
//  SettingsTableViewCell.swift
//  Moviemax
//
//  Created by Evgeny on 04.04.2023.
//

import UIKit

protocol SettingsTableViewCellDelegate: AnyObject {
    func changeAppearance(isDarkModeEnabled: Bool)
}

final class SettingsTableViewCell: UITableViewCell {
    
    // MARK: - Types
    
    enum CellType {
        case profile, changePassword, forgotPassword, darkMode
        
        var title: String {
            switch self {
            case .profile:
                return "Profile"
            case .changePassword:
                return "Change Password"
            case .forgotPassword:
                return "Forgot Password"
            case .darkMode:
                return "Dark Mode"
            }
        }
        var iconName: String {
            switch self {
            case .profile:
                return "person-icon"
            case .changePassword:
                return "Icon - Lock"
            case .forgotPassword:
                return "Unlock"
            case .darkMode:
                return "Activity"
            }
        }
    }

    // MARK: - Properties
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var nextButtonImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Icon - Next")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var appearanceSwitcher: UISwitch = {
       let switcher = UISwitch()
        switcher.isUserInteractionEnabled = true
        switcher.addTarget(self, action: #selector(didTapOnAppearanceSwitcher), for: .valueChanged)
        switcher.translatesAutoresizingMaskIntoConstraints = false
        
        return switcher
    }()
    
    private var type: CellType?
    private var delegate: SettingsTableViewCellDelegate?
        
    // MARK: - Public methods
    
    func configureCell(type: CellType, delegate: SettingsTableViewCellDelegate) {
        self.type = type
        self.delegate = delegate
        backgroundColor = UIColor(named: "BackgroundScreenColor")
        titleLabel.text = type.title
        iconImageView.image = UIImage(named: type.iconName)
        selectionStyle = .none
        configureConstraints()
    }
    
    // MARK: - Objc methods
    
    @objc func didTapOnAppearanceSwitcher(sender: UISwitch) {
        delegate?.changeAppearance(isDarkModeEnabled: sender.isOn)
    }

    // MARK: - Private methods
    
    private func configureConstraints() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            iconImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            iconImageView.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
        guard let type = type else { return }
        
        switch type {
        case .profile:
            contentView.addSubview(nextButtonImageView)
            
            NSLayoutConstraint.activate([
                nextButtonImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
                nextButtonImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                nextButtonImageView.widthAnchor.constraint(equalToConstant: 24),
                nextButtonImageView.heightAnchor.constraint(equalToConstant: 24)
            ])
        case .darkMode:
            contentView.addSubview(appearanceSwitcher)
            
            NSLayoutConstraint.activate([
                appearanceSwitcher.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
                appearanceSwitcher.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                appearanceSwitcher.heightAnchor.constraint(equalToConstant: 24),
                appearanceSwitcher.widthAnchor.constraint(equalToConstant: 44)
            ])
        default:
            break
        }
    }
}

