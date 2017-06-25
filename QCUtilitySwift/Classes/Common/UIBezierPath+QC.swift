//
//  UIBezierPath+QC.swift
//  Pods
//
//  Created by Qi Chen on 6/25/17.
//
//

import Foundation

extension UIBezierPath {
    public class func createPolygon(points: [CGPoint]) -> UIBezierPath? {
        if points.count < 3 {
            return nil
        }
        let polygon = UIBezierPath()
        polygon.move(to: points.first!)
        for i in 1 ..< points.count {
            let point = points[i]
            polygon.addLine(to: point)
        }
        polygon.close()
        return polygon
    }
}
