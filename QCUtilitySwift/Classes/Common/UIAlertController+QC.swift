//
//  UIAlertController+QC.swift
//  Pods
//
//  Created by Qi Chen on 12/26/16.
//
//

import Foundation

extension UIAlertController {
    public class func defaultAlert(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            
        })
        alertController.addAction(alertAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
