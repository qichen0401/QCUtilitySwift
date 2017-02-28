//
//  UIView+QC.swift
//  Pods
//
//  Created by Qi Chen on 2/28/17.
//
//

import Foundation

extension UIView {
    public func configureBorder(borderWidth: CGFloat, borderColor: CGColor, cornerRadius: CGFloat) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
}
