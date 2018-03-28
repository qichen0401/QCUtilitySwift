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
    
    // MARK: - draw
    
    public func drawAt(originX: CGFloat, centerY: CGFloat, withAttributes attrs: [NSAttributedStringKey : Any]? = nil) {
        let size = self.size(withAttributes: attrs)
        self.draw(at: CGPoint(x: originX, y: centerY - size.height/2), withAttributes: attrs)
    }
    
    public func drawAt(centerX: CGFloat, originY: CGFloat, withAttributes attrs: [NSAttributedStringKey : Any]? = nil) {
        let size = self.size(withAttributes: attrs)
        self.draw(at: CGPoint(x: centerX - size.width/2, y: originY), withAttributes: attrs)
    }

}
