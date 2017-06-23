//
//  Int+QC.swift
//  Pods
//
//  Created by Qi Chen on 6/23/17.
//
//

import Foundation

extension Int {
    public static var random: Int {
        get {
            return Int(arc4random())
        }
    }
    
    // return a Int between 0 and n-1
    
    public static func random(n: Int) -> Int {
        return random % n
    }
    
    //return a Int between min and max
    
    public static func random(min: Int, max: Int) -> Int {
        return random % (max - min + 1) + min
    }
}
