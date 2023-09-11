//
//  ShopDetailView.swift
//  ME
//
//  Created by 새미 on 2023/09/09.
//

import UIKit
import SnapKit
import Then

final class ShopDetailView: UIView {
    
    // MARK: - Properties
    var product: Shop? {
        didSet {
            guard let product = product else { return }
            productImage.image = product.productImage
            productLabel.text = product.productName
            brandLabel.text = product.brandName
            priceLabel.text = String(product.price)
            notice.text = product.notice
        }
    }

    let background = UIView().then {
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    let productImage = UIImageView()
    
    let brandLabel = UILabel().then {
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    let productLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 22, weight: .medium)
    }
    
    let priceLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    }
    
    let divLine = UIView().then {
        $0.backgroundColor = .gray
    }
    
    let noticeLabel = UILabel().then {
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        $0.text = "유의사항"
    }
    
    let notice = UILabel().then {
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.textAlignment = .left
    }
    
    let buyButton = BuyButton()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:  - Add View
    private func addView() {
        [background, productImage, brandLabel, productLabel, priceLabel, divLine, noticeLabel, notice, buyButton].forEach { self.addSubview($0) }
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = .background
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = background.bounds
        
        let colors: [CGColor] = [
            .init(red: 0.27, green: 0.27, blue: 0.27, alpha: 1),
            .init(red: 0.225, green: 0.225, blue: 0.225, alpha: 1),
            .init(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        ]
        gradientLayer.colors = colors
        
        gradientLayer.type = .radial
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        background.layer.addSublayer(gradientLayer)
        
        buyButton.layer.masksToBounds = true
        buyButton.layer.cornerRadius = 10
        
        notice.setLineSpacing(spacing: 4)
    }
    
    private func setLayout() {
        background.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().inset(97)
            $0.height.equalTo(338.78)
        }
        
        productImage.snp.makeConstraints {
            $0.top.equalTo(background.snp.top).offset(27)
            $0.bottom.equalTo(background.snp.bottom).offset(-27)
            $0.leading.equalTo(background.snp.leading).offset(16)
            $0.trailing.equalTo(background.snp.trailing).offset(-16)
        }
        
        brandLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30)
            $0.top.equalTo(background.snp.bottom).offset(31.22)
        }
        
        productLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30)
            $0.top.equalTo(brandLabel.snp.bottom).offset(6)
        }
        
        priceLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30)
            $0.top.equalTo(productLabel.snp.bottom).offset(23)
        }
        
        divLine.snp.makeConstraints {
            $0.height.equalTo(0.5)
            $0.top.equalTo(priceLabel.snp.bottom).offset(19)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        noticeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30)
            $0.top.equalTo(divLine.snp.bottom).offset(19)
        }
        
        notice.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30)
            $0.top.equalTo(noticeLabel.snp.bottom).offset(6)
            $0.width.equalTo(340)
        }
        
        buyButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-28)
            $0.height.equalTo(57)
        }
    }
    
}
