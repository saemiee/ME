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
            guard var product = product else { return }
            productImage.image = product.productImage
            productLabel.text = product.productName
            brandLabel.text = product.brandName
            priceLabel.text = product.brandName
        }
    }
    
    let gradientLayer = CAGradientLayer()
    
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
    
    let buyButton = UIButton().then {
        $0.backgroundColor = .yellow
        $0.setTitle("교환하기", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    
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
        [background, brandLabel, productLabel, priceLabel, buyButton].forEach { self.addSubview($0) }
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
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
    }
    
    private func setLayout() {
        background.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().inset(97)
            $0.height.equalTo(338.78)
        }
        
        productImage.snp.makeConstraints {
            $0.top.equalTo(background.snp.top).offset(61.27)
            $0.bottom.equalTo(background.snp.bottom).offset(-61.54)
            $0.leading.equalTo(background.snp.leading).offset(102)
            $0.trailing.equalTo(background.snp.trailing).offset(-102)
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
        
        buyButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(33)
            $0.height.equalTo(57)
        }
        
        
    }

}
