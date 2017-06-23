//
//  Double+QC.swift
//  Pods
//
//  Created by Qi Chen on 6/23/17.
//
//

import Foundation

extension Double {
    //return a double between 0 and 1
    
    public static var random: Double {
        get {
            return Double(arc4random()) / Double(UInt32.max)
        }
    }
    
    // return a double between min and max
    
    public static func random(min: Double, max: Double) -> Double {
        return random * (max - min) + min
    }
}
