//
//  ShopDetailViewController.swift
//  ME
//
//  Created by 새미 on 2023/09/09.
//

import UIKit
import SnapKit

final class ShopDetailViewController: UIViewController {
    
    // MARK: - Properties
    private let detailView = ShopDetailView()
    
    var product: Shop?
    
    let buyButton = MECustomButton(frame: CGRect(x: 0, y: 0, width: 0, height: 57), title: "교환하기")
    
    override func loadView() {
        view = detailView
    }
    
    // MARK: - Life Cycel
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        
        setData()
        setupButton()
    }
    
    // MARK: - Data Setting
    private func setData() {
        detailView.product = product
    }
    
    func setupButton() {
        view.addSubview(buyButton)
        
        buyButton.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
        
        buyButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(57)
            $0.bottom.equalToSuperview().inset(57)
        }
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
        let failedVC = BuyFailedViewController()
        
        failedVC.modalPresentationStyle = .overFullScreen
        present(failedVC, animated: false)
    }
    
}
    
