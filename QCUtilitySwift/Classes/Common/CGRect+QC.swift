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
    
    public func ellipseContains(point: CGPoint) -> Bool {
        let x = point.x
        let y = point.y
        let h = self.center.x
        let k = self.center.y
        let a = self.width/2
        let b = self.height/2
        let result = (x - h)*(x - h)/(a*a) + (y-k)*(y-k)/(b*b)
        return result <= 1
    }
    
}
