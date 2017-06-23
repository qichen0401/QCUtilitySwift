//
//  CGFloat+QC.swift
//  Pods
//
//  Created by Qi Chen on 6/23/17.
//
//

import Foundation

extension CGFloat {
    //return a CGFloat between 0 and 1
    
    public static var random: CGFloat {
        get {
            return CGFloat(arc4random()) / CGFloat(UInt32.max)
        }
    }
    
    // return a CGFloat between min and max
    
    public static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random * (max - min) + min
    }
}
