//
//  CGAffineTransform+QC.swift
//  QCUtilitySwift
//
//  Created by Qi Chen on 1/4/18.
//

import Foundation

extension CGAffineTransform {
    public var scaleX: CGFloat {
        get {
            return sqrt(a*a + c*c)
        }
    }
    
    public var scaleY: CGFloat {
        get {
            return sqrt(b*b + d*d)
        }
    }
    
    public var translation: CGPoint {
        get {
            return CGPoint(x: tx, y: ty)
        }
    }
}
