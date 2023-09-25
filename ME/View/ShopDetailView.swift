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
            priceLabel.text = "\(product.price) p"
            notice.text = product.notice
        }
    }

    private let scrollView = UIScrollView()
    
    private let background = VignettingView()
    
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
    
    private let divLine = UIView().then {
        $0.backgroundColor = .gray
    }
    
    private let noticeLabel = UILabel().then {
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
        [background, productImage, brandLabel, productLabel, priceLabel, divLine, noticeLabel, notice].forEach { self.scrollView.addSubview($0) }
        
        self.addSubview(scrollView)
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = .background
        notice.setLineSpacing(spacing: 4)
        
        scrollView.contentSize = CGSize(
                    width: UIScreen.main.bounds.width,
                    height: notice.frame.maxY + 120
                    )
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        background.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(340)
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
            $0.width.equalTo(340)
            $0.height.equalTo(0.5)
            $0.top.equalTo(priceLabel.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
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
    }
}
