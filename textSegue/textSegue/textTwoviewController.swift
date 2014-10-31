//
//  textTwoviewController.swift
//  textSegue
//
//  Created by student on 10/24/14.
//  Copyright (c) 2014 two. All rights reserved.
//

import UIKit
protocol textTVCDelegate{
    func myVCidFinish(controller:ViewController,text:String)
}

class textTwoviewController: UIViewController {

    var delegate:textTVCDelegate? = nil
    var textString = ""
    
    @IBOutlet weak var tfUser: UITextField!
    @IBOutlet weak var fnLabel: UILabel!
    
    @IBAction func saveBT(sender: UIBarButtonItem) {
        if(delegate != nil){
            delegate!.myVCidFinish(self, text: fnLabel!.text!)
        }
        
    }
    @IBAction func okBT(sender: UIButton) {
        fnLabel.text = sender.titleLabel!.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fnLabel.text = textString
    }
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
