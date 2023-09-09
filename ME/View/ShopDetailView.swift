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
            price.text = product.brandName
        }
    }
    
    let productImage = UIImageView()
    
    let productLabel = UILabel()
    
    let brandLabel = UILabel()
    
    let price = UILabel()
    
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
        
    }
    
    // MARK: - Layout
    private func setLayout() {
        
    }

}
