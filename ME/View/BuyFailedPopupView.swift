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
    
    private let popupView = UIView().then {
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    private let mainLabel = UILabel().then {
        $0.text = "포인트가 부족합니다."
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "칼로리를 소모해 포인트를 적립하세요.\n아자잣 ~ !"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
        
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setPopup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setting Popup
    func setPopup() {
        addView()
        setLayout()
    }
    
    // MARK: - addView
    func addView() {
        [mainLabel, descriptionLabel].forEach { self.popupView.addSubview($0) }
        self.addSubview(popupView)
    }
    
    // MARK: - Setting Layout
    func setLayout() {
        popupView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(346)
            $0.leading.trailing.equalToSuperview().inset(43)
        }
                
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(popupView.snp.top).offset(46)
            $0.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
        }
    }
    
}
