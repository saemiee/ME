//
//  ShopCollectionViewCell.swift
//  ME
//
//  Created by 새미 on 2023/08/27.
//

import UIKit

final class ShopCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ExerciseCell"
    
    // MARK: - Properties
    let productImage = UIImageView()
    
    let brandNameLabel = UILabel()
    
    let productLabel = UILabel()
    
    let priceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
