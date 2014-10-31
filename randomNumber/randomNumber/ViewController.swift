//
//  ViewController.swift
//  randomNumber
//
//  Created by student on 9/24/14.
//  Copyright (c) 2014 pasakorn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var oneBT: UIButton!
    @IBOutlet weak var twoBT: UIButton!
    @IBOutlet weak var threeBT: UIButton!
    @IBOutlet weak var oneLB: UILabel!
    @IBOutlet weak var twoLB: UILabel!
    @IBOutlet weak var threeLB: UILabel!
    @IBOutlet weak var resetAll: UIButton!
    
    var i = 0, j = 0, k = 0
    
    @IBAction func oneAc(sender: AnyObject) {
        i++
        oneLB.text = "\(i)"
    }
    @IBAction func twoAc(sender: AnyObject) {
        j++
        twoLB.text = "\(j)"
    }
    
    @IBAction func three(sender: AnyObject) {
        
        k++
        threeLB.text = "\(k)"
    }
    
    @IBAction func resetAc(sender: AnyObject) {
        i = 0
        j = 0
        k = 0
        oneLB.text = "\(i)"
        twoLB.text = "\(j)"
        threeLB.text = "\(k)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

