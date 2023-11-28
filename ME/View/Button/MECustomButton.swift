//
//  BuyButton.swift
//  ME
//
//  Created by 새미 on 2023/09/11.
//

import UIKit

final class MECustomButton: UIButton {

    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        
        setButton(withTitle: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setButton(withTitle title: String) {
        backgroundColor = .yellow
        setTitle(title, for: .normal)
        setTitleColor(UIColor.black, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        layer.masksToBounds = true
        layer.cornerRadius = 10
    }
}
