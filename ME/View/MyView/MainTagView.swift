//
//  MainTagView.swift
//  ME
//
//  Created by 새미 on 2023/08/23.
//

import UIKit

final class MainTagView: UIView {

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .gray
        
        layer.cornerRadius = 7
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
