//
//  TabBarViewController.swift
//  ME
//
//  Created by 새미 on 2023/08/25.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
        let myVC = MyViewController()
        let shopVC = ShopViewController()
        
        
        myVC.title = "Home"
        shopVC.title = "Shop"
        
        myVC.tabBarItem.image = UIImage.init(systemName: "house")
        shopVC.tabBarItem.image = UIImage.init(systemName: "bag")
        
        let navigationMy = UINavigationController(rootViewController: myVC)
        let navigationShop = UINavigationController(rootViewController: shopVC)
        
        navigationMy.navigationBar.prefersLargeTitles = true
        navigationShop.navigationBar.prefersLargeTitles = true
        
        setViewControllers([navigationMy, navigationShop], animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBar.tintColor = UIColor.yellow
        tabBar.backgroundColor = .clear
    }

}
