//
//  TipViewController.swift
//  Tipper
//
//  Created by Neal Patel on 12/18/15.
//  Copyright © 2015 Neal Patel. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var selectedTipValue: UISegmentedControl!
    @IBOutlet weak var displayTip: UILabel!
    @IBOutlet weak var displayTotal: UILabel!
    
    var tip : Float = 0.0
    
    // Returns the local currency symbol in form of a string
    func getCurrencySymbol() -> String {
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        let currencySymbol = String(formatter.currencySymbol!)
        
        return currencySymbol
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
        selectedTipValue.selectedSegmentIndex = -1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectedTipValueChanged(sender: AnyObject) {
    
        switch selectedTipValue.selectedSegmentIndex {
            
        case 0:
            tip = 0.18
            break
            
        case 1:
            tip = 0.20
            break
            
        case 2:
            tip = 0.25
            break
            
        default:
            break
        }
        
        print("Tip is \(tip)")
        
        let tipping = Float(billAmountTextField.text!)! * tip
        let total = Float(billAmountTextField.text!)! + tipping
        displayTip.text! = "\(getCurrencySymbol())\(String(format: "%.2f", tipping))"
        displayTotal.text! = "\(getCurrencySymbol())\(String(format: "%.2f", total))"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
