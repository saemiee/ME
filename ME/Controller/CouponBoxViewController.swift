//
//  CouponBoxViewController.swift
//  ME
//
//  Created by 새미 on 2023/10/18.
//

import UIKit

import SnapKit
import Then

final class CouponBoxViewController: UIViewController {
    
    // MARK: - Properties
    private let flowLayout = UICollectionViewFlowLayout().then {
      $0.scrollDirection = .vertical
      $0.minimumLineSpacing = 18.0
      $0.minimumInteritemSpacing = 0
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout).then {
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = true
        $0.scrollIndicatorInsets = UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 4)
        $0.contentInset = .zero
        $0.backgroundColor = .clear
        $0.clipsToBounds = true
    }
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        setupNavBar()
    }
    
    // MARK: - NavigationBar Setting
    func setupNavBar() {
        title = "쿠폰함"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        appearance.shadowColor = .clear
        
        navigationController?.navigationBar.tintColor = .lightOrange
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}
