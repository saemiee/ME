//
//  buyFailedViewController.swift
//  ME
//
//  Created by 새미 on 2023/09/10.
//

import UIKit
import SnapKit

final class BuyFailedViewController: UIViewController {
    
    let popupView = BuyFailedPopupView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: - Setting
    private func setup() {
        self.view.backgroundColor = .black.withAlphaComponent(0.6)
        setLayout()
        actionButton()
    }
    
    // MARK: - Layout
    private func setLayout() {
        view.addSubview(popupView)
        
        popupView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(278)
            $0.height.equalTo(156)
        }
    }
    
    // MARK: - CheckButton Action
    func actionButton() {
        popupView.checkButton.addTarget(self, action: #selector(actionDismiss), for: .touchUpInside)
    }
    
    @objc func actionDismiss() {
        dismiss(animated: false)
    }
    
}

    
