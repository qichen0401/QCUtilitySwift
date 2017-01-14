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

class StoreManager: NSObject, SKPaymentTransactionObserver, SKProductsRequestDelegate {
    static let shared = StoreManager()
    
    struct NotificationName {
        static let UnlockFunctionality = "UnlockFunctionalityNotification"
        static let ProductRequest = "ProductRequestNotification"
    }
    
    var products: [SKProduct] = [] {
        didSet {
            configureProductsDictionary()
        }
    }
    var productsDictionary: [String : SKProduct] = [:]
    
    func configureProductsDictionary() {
        productsDictionary = [:]
        for product in products {
            productsDictionary[product.productIdentifier] = product
        }
    }
    
    var ready = false
    
    var productsRequest:SKProductsRequest!
    
    class func canMakePayments() -> Bool {
        return SKPaymentQueue.canMakePayments()
    }
    
    func addPaymentTransactionObserver() {
        SKPaymentQueue.default().add(self)
    }
    
    func removePaymentTransactionObserver() {
        SKPaymentQueue.default().remove(self)
    }
    
    func validate(_ productIdentifiers: Set<String>) {
        productsRequest = SKProductsRequest(productIdentifiers: productIdentifiers)
        productsRequest.delegate = self
        productsRequest.start()
    }
    
    func validateProductIdentifiers(fileName: String) {
        let productIdentifiers = FileManager.default.plist(fileName: fileName) as! [String]
        validate(Set(productIdentifiers))
    }
    
    func buy(_ product: SKProduct) {
        SKPaymentQueue.default().add(SKPayment(product: product))
    }
   
    func buy(productIdentifier: String) {
        if let product = productsDictionary[productIdentifier] {
            buy(product)
        }
    }
    
    func restore() {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    func complete(_ transaction: SKPaymentTransaction) {
        persist(transaction)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationName.UnlockFunctionality), object: self, userInfo: ["productIdentifier" : transaction.payment.productIdentifier])
        
        SKPaymentQueue.default().finishTransaction(transaction)
    }
    
    func persist(_ transaction: SKPaymentTransaction) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: transaction.payment.productIdentifier)
        userDefaults.synchronize()
    }
    
    // MARK: - SKProductsRequestDelegate
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        products = response.products
        
        print("Invalid Product Identifiers: \(response.invalidProductIdentifiers)")
        
        ready = true
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationName.ProductRequest), object: self)
    }
    
    // MARK: - SKPaymentTransactionObserver
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
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
