//
//  MyButton.swift
//  ME
//
//  Created by 새미 on 2023/09/19.
//

import UIKit
import Then

final class MyButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Button Setting
    func setButton() {
        setImage(UIImage(systemName: "person.crop.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 26)), for: .normal)
        tintColor = .yellow
        backgroundColor = .clear
        imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
    }
}


