//
//  VignettingView.swift
//  ME
//
//  Created by 새미 on 2023/09/20.
//

import UIKit

final class VignettingView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupView()
    }
    
    func setupView() {
        backgroundColor = .gray
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = bounds
        
        let colors: [CGColor] = [
            .init(red: 0.27, green: 0.27, blue: 0.27, alpha: 1),
            .init(red: 0.24, green: 0.24, blue: 0.24, alpha: 1),
            .init(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        ]
        
        gradientLayer.colors = colors
        
        gradientLayer.type = .radial
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        self.layer.addSublayer(gradientLayer)
    }
    
}
