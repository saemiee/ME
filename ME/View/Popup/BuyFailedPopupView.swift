//
//  buyFailedView.swift
//  ME
//
//  Created by 새미 on 2023/09/10.
//

import UIKit

import SnapKit
import Then

final class BuyFailedPopupView: UIView {
    
    private let mainLabel = UILabel().then {
        $0.text = "포인트가 부족합니다."
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "칼로리를 소모해 포인트를 적립하세요.\n아자잣 ~ !"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.setLineSpacing(spacing: 3)
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    
    let checkButton = PopupButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0), title: "확인")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setPopup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting Popup
    private func setPopup() {
        self.backgroundColor = .darkGray
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        addView()
        setLayout()
    }
    
    // MARK: - Add View
    private func addView() {
        [mainLabel, descriptionLabel, checkButton].forEach { self.addSubview($0) }
    }
    
    // MARK: - Layout
    private func setLayout() {
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }
        
        checkButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(44)
        }
    }
}
