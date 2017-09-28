//
//  PurchaseManager.swift
//  InAppPurchase_Arcade
//
//  Created by Stefan Markovic on 9/28/17.
//  Copyright © 2017 Stefan Markovic. All rights reserved.
//

import Foundation
import StoreKit

//IMPORTANT!!!
//we are calling PurchaseManager.instance.fetchproducts in appdelegate

class PurchaseManager: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    static let instance = PurchaseManager()
    
    let IAP_PURCHASE = "InAppPurchaseArcade.tier1"
    
    var productsRequest: SKProductsRequest!
    var products = [SKProduct]()
    
    //Getting products info from the app store
    func fetchProducts() {
        //Apple wants us to use the Set of Strings for out purchase products
        let productsIds = NSSet(object: IAP_PURCHASE) as! Set<String>
        productsRequest = SKProductsRequest(productIdentifiers: productsIds)
        productsRequest.delegate = self
        productsRequest.start()
    }
    
    //Check if user can make payment
    func purchaseConsumable() {
        
        if SKPaymentQueue.canMakePayments() && products.count > 0 {
            let purchaseProduct = products[0]
            let payment = SKPayment(product: purchaseProduct)
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)
            
        }
        
    }
    
    
    
    //Doing the acctual request to the app store and it stores our products to products array of skproducts
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
        if response.products.count > 0 {
            print(response.products.debugDescription)
            products = response.products
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased:
                SKPaymentQueue.default().finishTransaction(transaction)
                if transaction.payment.productIdentifier == IAP_PURCHASE {
                    UserDefaults.standard.set(true, forKey: IAP_PURCHASE)
                }
                break
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
                break
            case .restored:
                SKPaymentQueue.default().finishTransaction(transaction)
                break
            default:
                break
            }
        }
    }
}















