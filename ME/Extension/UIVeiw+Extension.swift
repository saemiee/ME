//
//  UIButton+Extension.swift
//  ME
//
//  Created by 새미 on 2023/09/21.
//

import UIKit

extension UIView {
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}
