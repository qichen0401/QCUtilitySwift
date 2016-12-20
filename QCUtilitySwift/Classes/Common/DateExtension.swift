//
//  DateExtension.swift
//  Pods
//
//  Created by Qi Chen on 12/14/16.
//
//

import Foundation

extension Date {
    public func string(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = dateStyle
        dateFormatter.timeStyle = timeStyle
        return dateFormatter.string(from: self)
    }
    
    public func dateOnly() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        return dateFormatter.date(from: dateFormatter.string(from: self))!
    }
    
}
