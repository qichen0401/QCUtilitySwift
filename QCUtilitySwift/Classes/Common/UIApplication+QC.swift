//
//  UIApplication+QC.swift
//  Pods
//
//  Created by Qi Chen on 6/28/17.
//
//

import Foundation

extension UIApplication {
    public static var rootViewController: UIViewController? {
        get {
            return UIApplication.shared.delegate?.window??.rootViewController
        }
    }
}
