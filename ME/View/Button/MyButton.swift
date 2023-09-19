//
//  MyButton.swift
//  ME
//
//  Created by 새미 on 2023/09/19.
//

import UIKit
import Then

final class MyButton: UIBarButtonItem {
    
    convenience init(target: Any?, action: Selector) {
        let buttonSize = CGSize(width: 32, height: 32)
        
        let myButton = UIButton(type: .system).then {
            $0.setImage(UIImage(systemName: "person.crop.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32)), for: .normal)
            $0.tintColor = .yellow
            $0.backgroundColor = .clear
            $0.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
            $0.frame = CGRect(origin: .zero, size: buttonSize)
        }
        
        myButton.addTarget(target, action: action, for: .touchUpInside)
        
        self.init(customView: myButton)
    }
}
