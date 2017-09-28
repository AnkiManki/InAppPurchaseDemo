//
//  PurchaseViewController.swift
//  InAppPurchase_Arcade
//
//  Created by Stefan Markovic on 9/28/17.
//  Copyright © 2017 Stefan Markovic. All rights reserved.
//

import UIKit
import StoreKit

class PurchaseViewController: UIViewController, SKPaymentTransactionObserver, SKProductsRequestDelegate {

    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productDescription: UITextView!
    @IBOutlet weak var buyButton: UIButton!
    
    var product: SKProduct?
    var productID = "InAppPurchaseArcade.tier2"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buyButton.isEnabled = false
        SKPaymentQueue.default().add(self)
        getProductInfo()
    }

    @IBAction func buyProduct(_ sender: UIButton) {
        let payment = SKPayment(product: product!)
        SKPaymentQueue.default().add(payment)
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
                
            case SKPaymentTransactionState.purchased:
                self.unlockFeature()
                SKPaymentQueue.default().finishTransaction(transaction)
            case SKPaymentTransactionState.failed:
                SKPaymentQueue.default().finishTransaction(transaction)
            default:
                break
            }
        }
    }
    
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        var products = response.products
        
        if products.count != 0 {
            product = products[0]
            buyButton.isEnabled = true
            productTitle.text = product!.localizedTitle
            productDescription.text = product!.localizedDescription
        } else {
            productTitle.text = "Product Not Found"
        }
        
        let invalids = response.invalidProductIdentifiers
        
        for product in invalids {
            print("Product not found \(product)")
        }
    }
    
    
    func getProductInfo() {
        
        if SKPaymentQueue.canMakePayments() {
            let request = SKProductsRequest(productIdentifiers: NSSet(object: self.productID) as! Set<String>)
            request.delegate = self
            request.start()
        } else {
            productDescription.text = "Please enable in app purchases in Settings"
        }
    }
    
    
    func unlockFeature() {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.homeViewController!.enableLevel2()
        buyButton.isEnabled = false
        productTitle.text = "Item has been purchased"
    }
    
    


}





































