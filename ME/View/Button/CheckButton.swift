//
//  CheckButton.swift
//  ME
//
//  Created by 새미 on 2023/09/11.
//

import UIKit

final class CheckButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setButton() {
        layer.cornerRadius = 10
        clipsToBounds = true
        setTitle("확인", for: .normal)
        setTitleColor(UIColor.black, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        backgroundColor = .yellow
    }
    
}
