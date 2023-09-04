//
//  ShopCollectionViewCell.swift
//  ME
//
//  Created by 새미 on 2023/08/27.
//

import UIKit
import SnapKit
import Then

final class ShopCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    let gradientLayer = CAGradientLayer()
    
    let background = UIView().then {
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }

    let productImage = UIImageView()
    
    let brandNameLabel = UILabel().then {
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 12, weight: .light)
    }
    
    let productLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
        $0.numberOfLines = 2
        $0.textAlignment = .left
    }
    
    let priceLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
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
    
    // MARK: - Add View
    func addView() {
        [background, productImage, brandNameLabel, productLabel, priceLabel].forEach { self.addSubview($0) }
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = background.bounds
        
        let colors: [CGColor] = [
            .init(red: 0.27, green: 0.27, blue: 0.27, alpha: 1),
            .init(red: 0.23, green: 0.23, blue: 0.23, alpha: 1),
            .init(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        ]
        gradientLayer.colors = colors
        
        gradientLayer.type = .radial
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        background.layer.addSublayer(gradientLayer)
    }
    
    func setLayout() {
        background.snp.makeConstraints {
            $0.width.equalTo(166)
            $0.height.equalTo(188)
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }

        productImage.snp.makeConstraints {
            $0.top.equalTo(background.snp.top).offset(27)
            $0.bottom.equalTo(background.snp.bottom).offset(-27)
            $0.leading.equalTo(background.snp.leading).offset(16)
            $0.trailing.equalTo(background.snp.trailing).offset(-16)
        }
        
        brandNameLabel.snp.makeConstraints {
            $0.top.equalTo(background.snp.bottom).offset(12)
            $0.leading.equalToSuperview()
            $0.width.equalTo(166)
        }
        
        productLabel.snp.makeConstraints {
            $0.top.equalTo(brandNameLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(productLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
        }
    }
    
}
