//
//  ReviewManager.swift
//  Pods
//
//  Created by Qi Chen on 6/6/17.
//
//

import UIKit
import StoreKit

public class ReviewManager: NSObject {
    struct defaultValues {
        static let fireCount = 3
        static let countKey = "reviewManager_Count"
    }
    
    public static let shared = ReviewManager()
    public var fireCount = defaultValues.fireCount
    
    @objc public func count() {
        let userDefaults = UserDefaults.standard
        
        var count = userDefaults.integer(forKey: defaultValues.countKey)
        count += 1
        
        if count >= fireCount {
            count = 0
            
            if #available(iOS 10.3, *) {
                SKStoreReviewController.requestReview()
            } else {
                // Fallback on earlier versions
            }
        }
        
        userDefaults.set(count, forKey: defaultValues.countKey)
        userDefaults.synchronize()
    }
    
    public func start() {
        NotificationCenter.default.addObserver(self, selector: #selector(ReviewManager.count), name: .UIApplicationWillEnterForeground, object: nil)
        count()
    }
    
    public func start(fireCount fc: Int) {
        RateAppManager.fireCount = fc
        start()
    }
}
