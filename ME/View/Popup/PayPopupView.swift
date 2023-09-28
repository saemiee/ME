//
//  PayPopupView.swift
//  ME
//
//  Created by 새미 on 2023/09/22.
//

import UIKit
import SnapKit
import Then

final class PayPopupView: UIView {
    
    var product: Shop? {
        didSet {
            guard var product = product else { return }
            self.brandLabel.text = product.brandName
            self.productLabel.text = product.productName
            self.pointLabel.text = String(product.price)
        }
    }
    
    let titleLabel = UILabel().then {
        $0.textColor = .white
        $0.text = "포인트 교환"
        $0.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    
    let productFrame = UIView().then {
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
    }
    
    let brandLabel = UILabel().then {
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textAlignment = .left
    }
    
    let productLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.textAlignment = .left
    }
    
    let pointLabel = UILabel().then {
        $0.textColor = .lightOrange
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.textAlignment = .right
    }
    
    let myPointLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.text = "내 포인트"
    }
    
    let myPoint = UILabel().then {
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textAlignment = .right
        $0.text = "160000 p"
    }
    
    let cancelButton = PopupButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0), title: "취소")
    
    let divLine = UIView().then {
        $0.backgroundColor = .white
    }
    
    let changeButton = PopupButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0), title: "확인")
    

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
    
    // MARK: Add View
    private func addView() {
        [titleLabel, productFrame, myPointLabel, myPoint, cancelButton, divLine, changeButton].forEach { self.addSubview($0) }
        [brandLabel, productLabel, pointLabel].forEach { productFrame.addSubview($0) }
    }
    
    // MARK: - Layout
    private func setLayout() {
        brandLabel.snp.makeConstraints {
            $0.top.equalTo(productFrame.snp.top).offset(14)
            $0.leading.equalTo(productFrame.snp.leading).offset(12)
        }

        productLabel.snp.makeConstraints {
            $0.top.equalTo(brandLabel.snp.bottom).offset(8)
            $0.leading.equalTo(productFrame.snp.leading).offset(12)
        }

        pointLabel.snp.makeConstraints {
            $0.centerY.equalTo(productFrame.snp.centerY)
            $0.trailing.equalTo(productFrame.snp.trailing).offset(-12)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(23)
            $0.leading.equalToSuperview().inset(20)
        }
        
        productFrame.snp.makeConstraints {
            $0.width.equalTo(238)
            $0.height.equalTo(68)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(23)
        }

        myPointLabel.snp.makeConstraints {
            $0.top.equalTo(productFrame.snp.bottom).offset(23)
            $0.trailing.equalTo(myPoint.snp.leading).offset(-16)
        }

        myPoint.snp.makeConstraints {
            $0.top.equalTo(productFrame.snp.bottom).offset(23)
            $0.trailing.equalToSuperview().inset(28)
        }

        cancelButton.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview()
            $0.width.equalTo(139)
            $0.height.equalTo(44)
        }
        
        divLine.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.width.equalTo(0.2)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }

        changeButton.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview()
            $0.width.equalTo(139)
            $0.height.equalTo(44)
        }
    }
}
