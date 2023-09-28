//
//  TabBarViewController.swift
//  ME
//
//  Created by 새미 on 2023/08/25.
//

import UIKit
import Then

final class TabBarViewController: UITabBarController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeViewController()
        let shopVC = ShopViewController()
    
        homeVC.title = "ME"
        shopVC.title = "Shop"
        
        homeVC.tabBarItem.image = UIImage.init(systemName: "house")
        shopVC.tabBarItem.image = UIImage.init(systemName: "bag")
        
        let navigationHome = UINavigationController(rootViewController: homeVC)
        let navigationShop = UINavigationController(rootViewController: shopVC)
        
        navigationHome.navigationBar.prefersLargeTitles = true
        navigationShop.navigationBar.prefersLargeTitles = true
        
        setViewControllers([navigationHome, navigationShop], animated: false)
    }
    
    // MARK: - Layout
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBar.tintColor = UIColor.yellow
        tabBar.backgroundColor = .background
    }
}
