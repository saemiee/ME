//
//  PopupButton.swift
//  ME
//
//  Created by 새미 on 2023/09/21.
//

import UIKit

final class PopupButton: UIButton {
    
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        self.frame = frame
        
        setButton(withTitle: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addBorder(positions: [.top], color: .white, width: 0.2)
    }
    
    
    // MARK: - Button Setting
    func setButton(withTitle title: String) {
        backgroundColor = .clear
        setTitle(title, for: .normal)
        setTitleColor(UIColor.yellow, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)

        self.roundCorners(cornerRadius: 10, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
    }
}
