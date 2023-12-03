//
//  CouponUseButton.swift
//  ME
//
//  Created by 새미 on 12/3/23.
//

import UIKit

import SnapKit
import Then

final class CouponButton: UIButton {
    
    init(frame: CGRect, title: String, backgroundColor: UIColor) {
        super.init(frame: frame)
        
        setButton(withTitle: title, withBackground: backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Button Setting
    func setButton(withTitle title: String, withBackground backgroundColor: UIColor) {
        setTitle(title, for: .normal)
        setTitleColor(UIColor.black, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        layer.masksToBounds = true
        layer.cornerRadius = 20
        
        self.backgroundColor = backgroundColor
    }
}
