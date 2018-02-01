//
//  UIButton+QC.swift
//  Alamofire
//
//  Created by Qi Chen on 31/01/2018.
//

import Foundation

extension UIButton {
    public func alignVertical(spacing: CGFloat = 8.0) {
        guard let imageViewBounds = imageView?.bounds,
            let titleLabelBounds = titleLabel?.bounds else {
                return
        }
        titleEdgeInsets = UIEdgeInsets(top: 0,
                                       left: -imageViewBounds.width,
                                       bottom: -imageViewBounds.height-spacing,
                                       right: 0)
        imageEdgeInsets = UIEdgeInsets(top: -titleLabelBounds.height-spacing,
                                       left: 0,
                                       bottom: 0,
                                       right: -titleLabelBounds.width)
    }
}
