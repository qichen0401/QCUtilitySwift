//
//  CGSize+QC.swift
//  Pods
//
//  Created by Qi Chen on 6/28/17.
//
//

import Foundation

extension CGSize {
    
    public func aspectFit(size: CGSize) -> CGSize {
        var newWidth = size.width
        var newHeight = size.width / width * height
        if newHeight > size.height {
            newWidth = size.height / height * width
            newHeight = size.height
        }
        return CGSize(width: newWidth, height: newHeight)
    }
}
