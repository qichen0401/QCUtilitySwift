//
//  UILocalNotificationExtension.swift
//  Pods
//
//  Created by Qi Chen on 12/15/16.
//
//

import Foundation

extension UILocalNotification {
    public class func registerDefaultUserNotificationSettings() {
    UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
    }
    
    public class func scheduleNotification(fireDate: Date, repeatInterval: NSCalendar.Unit, alertBody: String) {
        let localNotification = UILocalNotification()
        localNotification.fireDate = fireDate
        localNotification.repeatInterval = repeatInterval
        localNotification.alertBody = alertBody
        localNotification.soundName = UILocalNotificationDefaultSoundName
        
        UIApplication.shared.scheduleLocalNotification(localNotification)
    }
    
    public class func scheduleNotification(fireDate: Date, alertBody: String) {
        UILocalNotification.scheduleNotification(fireDate: fireDate, repeatInterval: NSCalendar.Unit(rawValue: 0), alertBody: alertBody)
    }
}
