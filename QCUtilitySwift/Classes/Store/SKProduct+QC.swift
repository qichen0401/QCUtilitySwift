//
//  SKProduct+QC.swift
//  Pods
//
//  Created by Qi Chen on 1/14/17.
//
//

import Foundation
import StoreKit

extension SKProduct {
    open var formattedPrice: String {
        get {
            let numberFormatter = NumberFormatter()
            numberFormatter.formatterBehavior = .behavior10_4
            numberFormatter.numberStyle = .currency
            numberFormatter.locale = self.priceLocale
            return numberFormatter.string(from: self.price) ?? ""
        }
    }
}
