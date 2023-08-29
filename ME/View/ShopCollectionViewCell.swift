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
    
    static let identifier = "ExerciseCell"
    
    // MARK: - Properties
    lazy var background = UIView().then {
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    let backgroundBlur = UIView().then {
        $0.backgroundColor = .blurGray
    }
    
    let productImage = UIImageView()
    
    let brandNameLabel = UILabel().then {
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 12, weight: .light)
    }
    
    let productLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
    }
    
    let priceLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundBlur.layer.cornerRadius = backgroundBlur.frame.width / 2
    }
    
    func addView() {
        [background, backgroundBlur, productImage, brandNameLabel, productLabel, priceLabel].forEach { self.addSubview($0) }
    }
    
    func setLayout() {
        background.snp.makeConstraints {
            $0.width.equalTo(166)
            $0.height.equalTo(188)
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        backgroundBlur.snp.makeConstraints {
            $0.top.equalTo(background.snp.top).offset(23)
            $0.leading.equalTo(background.snp.leading).offset(23)
            $0.trailing.equalTo(background.snp.trailing).offset(-23)
            $0.bottom.equalTo(background.snp.bottom).offset(-45)
        }
       
        productImage.snp.makeConstraints {
            $0.top.equalTo(background.snp.top).offset(27)
            $0.bottom.equalTo(background.snp.bottom).offset(-27)
            $0.leading.equalTo(background.snp.leading).offset(18)
            $0.trailing.equalTo(background.snp.trailing).offset(-18)
        }
        
        brandNameLabel.snp.makeConstraints {
            $0.top.equalTo(background.snp.bottom).offset(12)
            $0.leading.equalToSuperview()
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
