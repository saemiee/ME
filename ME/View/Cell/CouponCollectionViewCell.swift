//
//  CouponCollectionViewCell.swift
//  ME
//
//  Created by 새미 on 12/3/23.
//

import UIKit

import SnapKit
import Then

final class CouponCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    let productImage = UIImageView()
    
    let brandNameLabel = UILabel().then {
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 12, weight: .light)
    }
    
    let productLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
    }
    
    let periodOfUse = UILabel().then {
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 12, weight: .light)
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
