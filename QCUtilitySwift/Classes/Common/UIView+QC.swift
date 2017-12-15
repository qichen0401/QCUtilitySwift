//
//  UIView+QC.swift
//  Pods
//
//  Created by Qi Chen on 2/28/17.
//
//

import Foundation

extension UIView {
    
    @available(iOS 11.0, *)
    public func fill(in view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.removeConstraints(self.constraints)
        NSLayoutConstraint.activate([
            view.leftAnchor.constraint(equalTo: self.leftAnchor),
            view.rightAnchor.constraint(equalTo: self.rightAnchor),
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ])
    }
    
    @available(iOS 11.0, *)
    public func fillSafeArea(in view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.removeConstraints(self.constraints)
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            guide.leftAnchor.constraint(equalTo: self.leftAnchor),
            guide.rightAnchor.constraint(equalTo: self.rightAnchor),
            guide.topAnchor.constraint(equalTo: self.topAnchor),
            guide.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ])
    }
    
    public func configureBorder(borderWidth: CGFloat, borderColor: CGColor, cornerRadius: CGFloat) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    public func configureShapeMask(path: UIBezierPath) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        self.layer.mask = shapeLayer
    }
}
