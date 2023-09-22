//
//  PayPopupViewController.swift
//  ME
//
//  Created by 새미 on 2023/09/22.
//

import UIKit
import SnapKit

final class PayPopupViewController: UIViewController {
    
    let popupView = PayPopupView()

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
            $0.height.equalTo(235)
        }
    }
    
    // MARK: - CheckButton Action
    func actionButton() {
        popupView.cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        popupView.changeButton.addTarget(self, action: #selector(change), for: .touchUpInside)
    }
        
    @objc func cancel() {
        dismiss(animated: false)
    }
    
    @objc func change() {
        print("교환하기")
    }
}
