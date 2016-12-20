//
//  RateAppManager.swift
//  Pods
//
//  Created by Qi Chen on 12/19/16.
//
//

import UIKit

public class RateAppManager: NSObject {
    struct defaultValues {
        static let fireCount = 5
        static let openCountKey = "rateAppManager_OpenCount"
    }
    
    public static let shared = RateAppManager()
    public var fireCount = defaultValues.fireCount
    public var appId = ""
    
    public func start(appId: String) {
        self.appId = appId
        NotificationCenter.default.addObserver(self, selector: "updateOpenCount", name: .UIApplicationDidBecomeActive, object: nil)
    }
    
    public func start(appId: String, fireCount: Int) {
        self.fireCount = fireCount
        start(appId: appId)
    }
    
    public func updateOpenCount() {
        let userDefaults = UserDefaults.standard
        var openCount = userDefaults.integer(forKey: defaultValues.openCountKey)
        if openCount == -1 {
            return
        }
        userDefaults.set(openCount + 1, forKey: defaultValues.openCountKey)
        userDefaults.synchronize()
        
        if openCount > fireCount {
            let alertController = UIAlertController(title: "Please Rate Me!", message: "Thank you in advance.", preferredStyle: .alert)
            let alertAction1 = UIAlertAction(title: "Rate now", style: .default) { _ in
                userDefaults.set(-1, forKey: defaultValues.openCountKey)
                userDefaults.synchronize()
                
                UIApplication.shared.openURL(URL(string:"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?mt=8&type=Purple+Software&id=\(self.appId)&at=11l5PP")!)
            }
            let alertAction2 = UIAlertAction(title: "Never ask again", style: .default) { _ in
                userDefaults.set(-1, forKey: defaultValues.openCountKey)
                userDefaults.synchronize()
            }
            let alertAction3 = UIAlertAction(title: "Remind me later", style: .default) { _ in
                userDefaults.set(0, forKey: defaultValues.openCountKey)
                userDefaults.synchronize()
            }
            alertController.addAction(alertAction1)
            alertController.addAction(alertAction2)
            alertController.addAction(alertAction3)
            
            UIApplication.shared.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
}
