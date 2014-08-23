//
//  ViewController.swift
//  tipping
//
//  Created by Nelson Crespo on 8/14/14.
//  Copyright (c) 2014 Copypastel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var totalLabel : UILabel
    @IBOutlet var tipLabel : UILabel
    @IBOutlet var billField : UITextField
    @IBOutlet var tipSelector : UISegmentedControl
    @IBOutlet var tipAmount : UILabel
    
    let tipPercentages = [0.18, 0.20, 0.25]
    let key = "default_tip_percentage_index"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Tipping"
        
        // Hide the blinking input cursor
        billField.tintColor = UIColor.clearColor()
        
        // Set default settings
        var settings = NSUserDefaults.standardUserDefaults()
        var tipIndex = settings.integerForKey(key)
        tipSelector.selectedSegmentIndex = tipIndex
        
        // Initialize all values on screen
        self.onEditingChanged(self)
        
    }
    
    override func viewDidAppear(animated: Bool) {
       var settings = NSUserDefaults.standardUserDefaults()
        var tipIndex = settings.integerForKey(key)
        tipSelector.selectedSegmentIndex = tipIndex
        
        self.onEditingChanged(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender : AnyObject) {
        var billAmount = billField.text.bridgeToObjectiveC().doubleValue
        //var tipPercentage
        var tip = billAmount * tipPercentages[tipSelector.selectedSegmentIndex]
        var total = billAmount + tip
        
        tipAmount.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender : AnyObject) {
        view.endEditing(true)
    }
}

