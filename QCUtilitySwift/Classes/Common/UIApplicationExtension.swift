//
//  UIApplicationExtension.swift
//  Pods
//
//  Created by Qi Chen on 12/20/16.
//
//

import Foundation

extension UIApplication {
    public var rootViewController: UIViewController? {
        return keyWindow?.rootViewController
    }
}
