//
//  Array+QC.swift
//  Pods
//
//  Created by Qi Chen on 6/26/17.
//
//

import Foundation

extension Array where Element : Equatable {
    public mutating func remove(element: Element) {
        if let index = self.index(of: element) {
            self.remove(at: index)
        }
    }
}
