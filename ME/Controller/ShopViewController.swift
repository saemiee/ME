//
//  ShopViewController.swift
//  ME
//
//  Created by 새미 on 2023/08/15.
//

import UIKit
import SnapKit
import Then

final class ShopViewController: UIViewController {
    
    // MARK: - Properties
    private let mainLabel = UILabel().then {
        $0.text = "포인트를 다양한 기프티콘으로 교환해 보세요."
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }

    // MARK: - Life Cycel
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        setupLayout()
    }
    
    private func addView() {
        view.addSubview(mainLabel)
    }
    
    private func setupLayout() {
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(6)
            $0.leading.equalToSuperview().inset(15)
        }
    }
    
}
