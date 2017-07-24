//
//  CGPoint+QC.swift
//  Pods
//
//  Created by Qi Chen on 7/24/17.
//
//

import Foundation

extension CGPoint {
    public func add(point: CGPoint) -> CGPoint {
        return CGPoint(x: x + point.x, y: y + point.y)
    }
    
    public func minus(point: CGPoint) -> CGPoint {
        return CGPoint(x: x - point.x, y: y - point.y)
    }
}
