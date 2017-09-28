//
//  ViewController.swift
//  InAppPurchase_Arcade
//
//  Created by Stefan Markovic on 9/25/17.
//  Copyright © 2017 Stefan Markovic. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout /*, SKProductsRequestDelegate */ {

    @IBOutlet weak var myCollectionView: UICollectionView!
    var products = ["tier1","tier2","tier3","tier4","tier5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
//        requestProducts()
    }

    @IBAction func removeBtn(_ sender: UIButton) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "purchaseCell", for: indexPath) as? PurchaseCell {
            cell.configureCell(imageName: products[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.myCollectionView.bounds.size.width / 2 - 20, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
    
//    func requestProducts() {
//
//        let ids: Set<String> = ["InAppPurchaseArcade.tier1", "InAppPurchaseArcade.tier2","InAppPurchaseArcade.tier3","InAppPurchaseArcade.tier4","InAppPurchaseArcade.tier5"]
//
//        let productsRequest = SKProductsRequest(productIdentifiers: ids)
//        productsRequest.delegate = self
//        productsRequest.start()
//
//    }
//
//
//    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
//        print("Products ready: \(response.products.count)")
//        print("Products not ready: \(response.invalidProductIdentifiers.count)")
//    }


}





















