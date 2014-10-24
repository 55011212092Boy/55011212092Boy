//
//  ViewController.swift
//  textSegue
//
//  Created by student on 10/24/14.
//  Copyright (c) 2014 two. All rights reserved.
//

import UIKit
protocol textTVCDelegate{
    func myVCidFinish(controller:ViewController,text:String)
}

class ViewController: UIViewController {
    
    @IBOutlet var tfUser: UITextField!
    
    var delegate:textTVCDelegate? = nil
    var textString = ""
    
    

    @IBAction func loginBT(sender: UIButton) {
        sender.select(tfUser)
        if(delegate != nil){
            delegate!.myVCidFinish(self, text: tfUser!.text!)
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tfUser.text = textString
    }


}

