//
//  TagCollectionViewCell.swift
//  ME
//
//  Created by 새미 on 2023/08/31.
//

import UIKit
import SnapKit
import Then

final class TagCollectionViewCell: UICollectionViewCell {
    static let identifier = "TagCell"
    
    // MARK: - Properties
    let tagImage = UIImageView()
    
    let tagLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
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
    private func addView() {
        [tagImage, tagLabel].forEach{ self.addSubview($0) }
    }
    
    // MARK: - Layout
    private func setLayout() {
        tagImage.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()        }
        
        tagLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

    
}
