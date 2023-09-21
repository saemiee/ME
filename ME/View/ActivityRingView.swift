//
//  ActivityRingView.swift
//  ME
//
//  Created by 새미 on 2023/09/17.
//

import UIKit
import SnapKit

final class ActivityRingView: UIView {
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        let path = UIBezierPath(arcCenter: center, radius: 65, startAngle: 0, endAngle: (360 * .pi), clockwise: true)
        let fillPath = UIColor.lightOrange.withAlphaComponent(0.3)
        
        fillPath.set()
        path.fill()
        
        let semiCircle = UIBezierPath(arcCenter: center, radius: 40, startAngle: 0, endAngle: (360 * .pi), clockwise: true)
        
        UIColor.gray.set()
        semiCircle.fill()
    }
}
