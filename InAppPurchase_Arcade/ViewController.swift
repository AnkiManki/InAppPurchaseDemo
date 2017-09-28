//
//  ViewController.swift
//  InAppPurchase_Arcade
//
//  Created by Stefan Markovic on 9/25/17.
//  Copyright © 2017 Stefan Markovic. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController {

    @IBOutlet weak var level2Button: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.homeViewController = self
    }
    
    
    func enableLevel2() {
        level2Button.isEnabled = true
    }
    

}





















