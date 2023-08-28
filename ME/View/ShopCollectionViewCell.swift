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
    let productImage = UIImageView()
    
    let brandNameLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 12, weight: .light)
    }
    
    let productLabel = UILabel()
    
    let priceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        
    }
    
    func setLayout() {
        
    }
    
}
