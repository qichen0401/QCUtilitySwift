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
    
    public func multiple(number: CGFloat) -> CGPoint {
        return CGPoint(x: x*number, y: y*number)
    }
    
    public func length() -> CGFloat {
        return sqrt(x * x + y * y)
    }
    
    public func distance(to point: CGPoint) -> CGFloat {
        return self.minus(point: point).length()
    }
    
    public func dotProduct(point: CGPoint) -> CGFloat {
        return self.x*point.x + self.y*point.y
    }
    
    public static func slope(point1: CGPoint, point2: CGPoint) -> CGFloat {
        return (point2.y - point1.y)/(point2.x - point1.x)
    }
    
    public static func angleOfVector(startPoint: CGPoint, endPoint: CGPoint) -> CGFloat {
        let u = endPoint.minus(point: startPoint)
        return atan2(u.y, u.x)
    }
    
    public static func angle(vertex: CGPoint, point1: CGPoint, point2: CGPoint) -> CGFloat {
        //        let u = point1.minus(point: vertex)
        //        let v = point2.minus(point: vertex)
        //        let angle = acos(u.dotProduct(point: v)/u.length()/v.length())
        //        return angle
        
        //        let k1 = CGPoint.slope(point1: vertex, point2: point1)
        //        let k2 = CGPoint.slope(point1: vertex, point2: point2)
        //        let angle = atan((k1 - k2)/(1 + k1*k2))
        //        return angle
        
        let u = point1.minus(point: vertex)
        let v = point2.minus(point: vertex)
        let angle = atan2(v.x*u.y - u.x*v.y, u.x*v.x + u.y*v.y)
        return angle
    }
}
