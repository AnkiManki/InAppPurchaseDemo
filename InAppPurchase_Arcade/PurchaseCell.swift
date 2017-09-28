//
//  PurchaseCell.swift
//  InAppPurchase_Arcade
//
//  Created by Stefan Markovic on 9/25/17.
//  Copyright © 2017 Stefan Markovic. All rights reserved.
//

import UIKit

class PurchaseCell: UICollectionViewCell {
    
    @IBOutlet weak var purchaseImage: UIImageView!
    @IBOutlet weak var purchaseLbl: UILabel!
    
    func configureCell(imageName: String) {
        
        switch imageName {
            
        case "tier1":
            purchaseImage.image = UIImage(named: "Arcade-1")
            purchaseLbl.text = "$2.500"
            break
        case "tier2":
            purchaseImage.image = UIImage(named: "Arcade-2")
            purchaseLbl.text = "$5.000"
            break
        case "tier3":
            purchaseImage.image = UIImage(named: "Arcade-3")
            purchaseLbl.text = "$10.000"
            break
        case "tier4":
            purchaseImage.image = UIImage(named: "Arcade-4")
            purchaseLbl.text = "$25.000"
            break
        case "tier5":
            purchaseImage.image = UIImage(named: "Bear-1")
            purchaseLbl.text = "$50.000"
            break
        default:
            break
        }
        
        
        
    }
    
    
    
    
    
}
