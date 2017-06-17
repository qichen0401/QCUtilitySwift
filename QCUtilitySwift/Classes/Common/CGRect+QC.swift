//
//  File.swift
//  Pods
//
//  Created by Qi Chen on 6/17/17.
//
//

import Foundation

extension CGRect {
    public init(center: CGPoint, size: CGSize) {
        let origin = CGPoint(x: center.x - size.width / 2, y: center.y - size.height / 2)
        self.init(origin: origin, size: size)
    }
    
}
