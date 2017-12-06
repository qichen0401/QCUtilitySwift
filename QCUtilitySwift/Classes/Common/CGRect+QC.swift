//
//  File.swift
//  Pods
//
//  Created by Qi Chen on 6/17/17.
//
//

import Foundation

extension CGRect {
    public var center: CGPoint {
        set {
            self.origin = CGPoint(x: center.x - self.size.width/2, y: center.y - self.size.height/2)
        }
        get {
            return CGPoint(x: self.origin.x + self.size.width/2, y: self.origin.y + self.size.height/2)
        }
    }
    public init(center: CGPoint, size: CGSize) {
        let origin = CGPoint(x: center.x - size.width / 2, y: center.y - size.height / 2)
        self.init(origin: origin, size: size)
    }
    
}
