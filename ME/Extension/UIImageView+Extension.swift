//
//  UIImageView+Extension.swift
//  ME
//
//  Created by 새미 on 12/8/23.
//

import UIKit

extension UIImageView {
    convenience init(resource: ImageResource) {
        self.init()
        self.image = UIImage(resource: resource)
    }
}
