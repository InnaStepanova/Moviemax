//
//  SettingsViewController.swift
//  Moviemax
//
//  Created by Evgeny on 04.04.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - Types
    
    enum SectionType {
        case userInfo, personalInfo, security
        
        var title: String {
            switch self {
            case .userInfo:
                return ""
            case .personalInfo:
                return "Personal info"
            case .security:
                return "Security"
            }
        }
        var rowsCount: Int {
            switch self {
            case .userInfo:
                return 1
            case .personalInfo:
                return 1
            case .security:
                return 3
            }
        }
    }
    
    // MARK: - Properties
    var currentUser = StorageManader.shared.getCurrentUser()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.backgroundColor = UIColor(named: "BackgroundScreenColor")
        tableView.register(UserInfoTableViewCell.self, forCellReuseIdentifier: "UserInfoCell")
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: "SettingsCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private let sections: [SectionType] = [.userInfo, .personalInfo, .security]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
        currentUser = StorageManader.shared.getCurrentUser()
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
    
    // MARK: - Private methods
    
    private func configureView() {
        configureConstraints()
        view.backgroundColor = UIColor(named: "BackgroundScreenColor")
        navigationItem.title = "Settings"
    }
    
    private func configureConstraints() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 38),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - TableViewDelegate, TableViewDataSource

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch sections[section] {
        case .userInfo:
            return .zero
        default:
            return 16
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerLabel = view as? UITableViewHeaderFooterView else {
            return
        }
        
        headerLabel.textLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        headerLabel.textLabel?.textColor = .black
    }
}

extension SettingsViewController: UITableViewDataSource {
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rowsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .userInfo:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoCell") as? UserInfoTableViewCell else {
                fatalError("Can't find cell with reuse identifier: UserInfoCell")
            }
            
            cell.configureCell(currentUser: StorageManader.shared.getCurrentUser())
            
            return cell
        case .personalInfo:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell") as? SettingsTableViewCell else {
                fatalError("Can't find cell with reuse identifier: SettingsCell")
            }
            
            cell.configureCell(type: .profile, delegate: self)
            
            return cell
        case .security:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell") as? SettingsTableViewCell else {
                fatalError("Can't find cell with reuse identifier: SettingsCell")
            }
            
            switch indexPath.row {
            case 0:
                cell.configureCell(type: .changePassword, delegate: self)
            case 1:
                cell.configureCell(type: .forgotPassword, delegate: self)
            case 2:
                cell.configureCell(type: .darkMode, delegate: self)
            default:
                break
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch sections[indexPath.section] {
        case .personalInfo:
            let profileSettingsVS = ProfileSettingsVC()
            profileSettingsVS.currentUser = currentUser
            navigationController?.pushViewController(profileSettingsVS, animated: true)
        case .security:
            switch indexPath.row {
            case 1:
                let alert = UIAlertController(title: "", message: "A message about password change has been sent to your email", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                navigationController?.present(alert, animated: true)
            default:
                break
            }
            
        default:
            break
        }
    }
}

extension SettingsViewController: SettingsTableViewCellDelegate {
    
    func changeAppearance(isDarkModeEnabled: Bool) {
        
        if isDarkModeEnabled {
            print("активирована темная тема")
        } else {
            print("активирована светлая тема")
        }
    }
}
