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
    
    // MARK: - UITableViewController
    
    public func sectionTitle() -> String {
        let sectionTitles = UILocalizedIndexedCollation.current().sectionTitles
        if self.isEmpty {
            return sectionTitles.last!
        }
        let pinYinString = self.pinYin()
        let firstCharacter = pinYinString.substring(to: pinYinString.index(after: pinYinString.startIndex)).uppercased()
        if sectionTitles.contains(firstCharacter) {
            return firstCharacter
        } else {
            return sectionTitles.last!
        }
    }
}
