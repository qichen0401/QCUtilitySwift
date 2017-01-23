//
//  StoreManager.swift
//  Pods
//
//  Created by Qi Chen on 1/14/17.
//
//

// Non-Consumable only

/*
 Help:
 1.
 application:didFinishLaunchingWithOptions:
 [[StoreManager sharedManager] addTransactionObserver];
 
 2.
 applicationWillTerminate:
 [[StoreManager sharedManager] removeTransactionObserver];
 
 3.
 validateProductIdentifiers
 
 4.
 ProductRequestNotification
 
 5.
 UnlockFunctionalityNotification
 */

import UIKit
import StoreKit

open class StoreManager: NSObject, SKPaymentTransactionObserver, SKProductsRequestDelegate {
    open static let shared = StoreManager()
    
    public struct NotificationName {
        public static let UnlockFunctionality = "UnlockFunctionalityNotification"
        public static let ProductRequest = "ProductRequestNotification"
    }
    
    open var products: [SKProduct] = [] {
        didSet {
            configureProductsDictionary()
        }
    }
    private var productsDictionary: [String : SKProduct] = [:]
    
    private func configureProductsDictionary() {
        productsDictionary = [:]
        for product in products {
            productsDictionary[product.productIdentifier] = product
        }
    }
    
    open var ready = false
    
    private var productsRequest:SKProductsRequest!
    
    open class func canMakePayments() -> Bool {
        return SKPaymentQueue.canMakePayments()
    }
    
    open func addPaymentTransactionObserver() {
        SKPaymentQueue.default().add(self)
    }
    
    open func removePaymentTransactionObserver() {
        SKPaymentQueue.default().remove(self)
    }
    
    open func validate(_ productIdentifiers: Set<String>) {
        productsRequest = SKProductsRequest(productIdentifiers: productIdentifiers)
        productsRequest.delegate = self
        productsRequest.start()
    }
    
    open func validateProductIdentifiers(fileName: String) {
        let productIdentifiers = FileManager.default.plist(fileName: fileName) as! [String]
        validate(Set(productIdentifiers))
    }
    
    open func buy(_ product: SKProduct) {
        SKPaymentQueue.default().add(SKPayment(product: product))
    }
   
    open func buy(productIdentifier: String) {
        if let product = productsDictionary[productIdentifier] {
            buy(product)
        }
    }
    
    open func restore() {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    private func complete(_ transaction: SKPaymentTransaction) {
        persist(transaction)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationName.UnlockFunctionality), object: self, userInfo: ["productIdentifier" : transaction.payment.productIdentifier])
        
        SKPaymentQueue.default().finishTransaction(transaction)
    }
    
    private func persist(_ transaction: SKPaymentTransaction) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: transaction.payment.productIdentifier)
        userDefaults.synchronize()
    }
    
    // MARK: - SKProductsRequestDelegate
    
    public func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        products = response.products
        
        if response.invalidProductIdentifiers.count > 0 {
            print("Invalid Product Identifiers: \(response.invalidProductIdentifiers)")
        }
        
        ready = true
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationName.ProductRequest), object: self)
    }
    
    // MARK: - SKPaymentTransactionObserver
    
    public func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchasing:
                print("purchasing")
            case .deferred:
                print("deferred")
            case .failed:
                print("failed")
                print("\(transaction.error?.localizedDescription)")
                SKPaymentQueue.default().finishTransaction(transaction)
            case .purchased:
                print("purchased")
                complete(transaction)
            case .restored:
                print("restored")
                complete(transaction)
            default:
                print("Unexpected transaction state \(transaction.transactionState)")
            }
        }
    }
    
}
