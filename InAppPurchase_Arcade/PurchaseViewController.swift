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
    var productID = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func buyProduct(_ sender: UIButton) {
        
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        //
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        //
    }
    

}
