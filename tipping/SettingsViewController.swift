//
//  SettingsViewController.swift
//  tipping
//
//  Created by Nelson Crespo on 8/23/14.
//  Copyright (c) 2014 Copypastel. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var doneButton : UIButton
    @IBOutlet var defaultTipPercentageSegments : UISegmentedControl
    
    var settings : NSUserDefaults
    let key = "default_tip_percentage_index"
    
    init(coder: NSCoder?) {
        settings = NSUserDefaults.standardUserDefaults()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var defaultTipPercentageIndex = settings.integerForKey(key)
        defaultTipPercentageSegments.selectedSegmentIndex = defaultTipPercentageIndex
        
        onPercentageChanged(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dismissModal(sender : AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveDefaultTipPercentage(sender : AnyObject) {
        
    }
    
    @IBAction func onPercentageChanged(sender : AnyObject) {
        settings.setInteger(defaultTipPercentageSegments.selectedSegmentIndex, forKey: key)
    }
}
