//
//  ShopDetailViewController.swift
//  ME
//
//  Created by 새미 on 2023/09/09.
//

import UIKit
import SnapKit
import Then

final class ShopDetailViewController: UIViewController {
    
    // MARK: - Properties
    private let detailView = ShopDetailView()
    
    var product: Shop?
    
    override func loadView() {
        view = detailView
    }
    
    // MARK: - Life Cycel
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
    }
    
    // MARK: - Data Setting
    private func setData() {
        detailView.product = product
    }
    
}
    
