//
//  UNUserNotificationCenter+QC.swift
//  Pods
//
//  Created by Qi Chen on 7/19/17.
//
//

import Foundation
import UserNotifications

@available(iOS 10.0, *)
extension UNUserNotificationCenter {
    public func requestDefaultAuthorization() {
        self.requestAuthorization(options: [.alert, .badge, .sound]) {
            if !$0.0 {
                UIAlertController.defaultAlert(title: "Notifications Disabled", message: "Please enable notifications in the Settings app.")
            }
            if let error = $0.1 {
                print(error.localizedDescription)
            }
        }
    }
}
