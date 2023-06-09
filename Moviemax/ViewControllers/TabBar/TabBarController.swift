//
//  TabBarController.swift
//  Moviemax
//
//  Created by Лаванда on 03.04.2023.
//

import UIKit

enum Tabs: Int {
    
    case search
    case video
    case main
    case favourites
    case profile
}

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 75
        tabBar.frame.origin.y = view.frame.height - 75
    }
    
    private func configure() {
        tabBar.backgroundColor = UIColor(named: "TabBarBGColor")
            
            let homeItem = UITabBarItem(title: nil, image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
            homeItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
            
            let videoItem =  UITabBarItem(title: nil, image: UIImage(named: "video"), selectedImage: UIImage(named: "video_fill"))
            videoItem.imageInsets = UIEdgeInsets(top: 19, left: 0, bottom: -19, right: 0)
            
            let searchItem =  UITabBarItem(title: nil, image: UIImage(named: "search_alt"), selectedImage: UIImage(named: "search_alt_fill"))
            searchItem.imageInsets = UIEdgeInsets(top: 19, left: 0, bottom: -19, right: 0)
            
            let favoritesItem = UITabBarItem(title: nil, image: UIImage(named: "heart"), selectedImage: UIImage(named: "heart_fill"))
            favoritesItem.imageInsets = UIEdgeInsets(top: 19, left: 0, bottom: -19, right: 0)
            
            let profileItem = UITabBarItem(title: nil, image: UIImage(named: "profile"), selectedImage: UIImage(named: "profile_fill"))
            profileItem.imageInsets = UIEdgeInsets(top: 19, left: 0, bottom: -19, right: 0)
          
            let searchViewController = SearchViewController()
            let videoViewController = RecentWatchViewController()
            let mainViewController = MainVC()
            let favoritesViewController = FavoritesViewController()
            let profileViewController = SettingsViewController()
            
            let searchNavigation = UINavigationController(rootViewController: searchViewController)
            let videoNavigation = UINavigationController(rootViewController: videoViewController)
            let mainNavigation = UINavigationController(rootViewController: mainViewController)
            let favoritesNavigation = UINavigationController(rootViewController: favoritesViewController)
            let profileNavigation = UINavigationController(rootViewController: profileViewController)

            searchViewController.tabBarItem = searchItem
            videoViewController.tabBarItem = videoItem
            mainViewController.tabBarItem = homeItem
            favoritesViewController.tabBarItem = favoritesItem
            profileViewController.tabBarItem = profileItem
            
            setViewControllers([
                searchNavigation,
                videoNavigation,
                mainNavigation,
                favoritesNavigation,
                profileNavigation
            ], animated: true)
        
        let currentTheme = UserDefaults.standard.value(forKey: "theme") as? Int
        overrideUserInterfaceStyle = currentTheme == 1 ? .light : .dark
        }
}
