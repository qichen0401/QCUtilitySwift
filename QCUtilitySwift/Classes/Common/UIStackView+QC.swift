//
//  UIStackView+QC.swift
//  QCUtilitySwift
//
//  Created by Qi Chen on 12/15/17.
//

import Foundation

@available(iOS 9.0, *)
extension UIStackView {
    public func removeAll() {
        for subview in self.arrangedSubviews {
            self.removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
    }
}
