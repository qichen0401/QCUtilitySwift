//
//  String+QC.swift
//  Pods
//
//  Created by Qi Chen on 12/27/16.
//
//

import Foundation

extension String {
    public func pinYin() -> String {
        let s = CFStringCreateMutableCopy(nil, 0, self as CFString!)!
        CFStringTransform(s, nil, kCFStringTransformToLatin, false)
        CFStringTransform(s, nil, kCFStringTransformStripCombiningMarks, false)
        return s as String
    }
}
