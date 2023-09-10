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
        
        view.backgroundColor = .background
        
        setData()
        setupButtonAction()
    }
    
    // MARK: - Data Setting
    private func setData() {
        detailView.product = product
    }
    
    // MARK: - Button Action
    func setupButtonAction() {
        detailView.buyButton.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Buy Button Tapped
    @objc func buyButtonTapped() {
        buyFailed()
        
    }
    
    // MARK: - Bay seccess
    func buySuccess() {
        
    }
    
    // MARK: - Bay failed
    func buyFailed() {
        let failedPopup = BuyFailedViewController()
        present(failedPopup, animated: true)
    }
    
}
    
