//
//  ActivityRingView.swift
//  ME
//
//  Created by 새미 on 2023/09/17.
//

import UIKit
import SnapKit

final class ActivityRingView: UIView {
    
    let circle = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.lightOrange
        setupCircle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.opacity = 0.3

        circle.layer.cornerRadius = circle.frame.width / 2
        circle.layer.opacity = 1
    }

    func setupCircle() {
        circle.backgroundColor = .white
        
        circle.layer.opacity = 1

        self.addSubview(circle)

        circle.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(70)
        }
    }
    
}
