//
//  FileManager+QC.swift
//  Pods
//
//  Created by Qi Chen on 1/14/17.
//
//

import Foundation

extension FileManager {
    public func plist(fileName: String) -> Any? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "plist"), let data = contents(atPath: path) {
            return try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil)
        }
        return nil
    }
}
