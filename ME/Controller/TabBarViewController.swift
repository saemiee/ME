//
//  TabBarViewController.swift
//  ME
//
//  Created by 새미 on 2023/08/25.
//

import UIKit

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

//MARK: - Preview [ SwiftUI를 이용한 미리보기 코드 ]

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        ViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
        }
        
    }
} #endif
