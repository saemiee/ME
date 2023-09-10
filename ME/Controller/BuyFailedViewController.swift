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

        setPopup()
    }
    
    func setPopup() {
        self.view.backgroundColor = .black.withAlphaComponent(0.3)
        setLayout()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.dismiss(animated: false, completion: nil)
        }
    }

    func setLayout() {
        view.addSubview(popupView)
        
        popupView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
