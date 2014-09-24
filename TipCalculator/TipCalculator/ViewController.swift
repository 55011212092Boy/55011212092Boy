//
//  ViewController.swift
//  Tipcalculator
//
//  Created by student on 9/24/14.
//  Copyright (c) 2014 pasakorn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var totalTextfield : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultsTexView: UITextView!
    
    @IBAction func calcualateTapped(sender : AnyObject){
        tipCalc.total = Double((totalTextfield.text as NSString).doubleValue)
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        for(tipPct,tipValue) in possibleTips{
            results += "\(tipPct)%: \(tipValue)\n"
        }
        resultsTexView.text = results
    }
    @IBAction func taxPercentageChanged(sender : AnyObject){
        tipCalc.taxPct = Double(taxPctSlider.value)/100.0
        refreshUI()
    }
    @IBAction func vewTapped(sender : AnyObject){
        totalTextfield.resignFirstResponder()
    }
    
    
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    func refreshUI(){
        totalTextfield.text = String(format: "%0.2f",tipCalc.total)
        taxPctSlider.value = Float(tipCalc.taxPct)*100.0
        taxPctLabel.text = "Tax Percentage(\(Int(taxPctSlider.value))%)"
        resultsTexView.text = ""
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

