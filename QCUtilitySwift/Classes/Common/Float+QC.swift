//
//  Float+QC.swift
//  Pods
//
//  Created by Qi Chen on 6/23/17.
//
//

import Foundation

extension Float {
    //return a float between 0 and 1
    
    public static var random: Float {
        get {
            return Float(arc4random()) / Float(UInt32.max)
        }
    }
    
    // return a float between min and max
    
    public static func random(min: Float, max: Float) -> Float {
        return random * (max - min) + min
    }
}
