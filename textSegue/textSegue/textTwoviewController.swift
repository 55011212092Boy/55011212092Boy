//
//  textTwoviewController.swift
//  textSegue
//
//  Created by student on 10/24/14.
//  Copyright (c) 2014 two. All rights reserved.
//

import UIKit


class textTwoviewController: UIViewController,textTVCDelegate {

    @IBOutlet  var textLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func myVCidFinish(controller: ViewController, text: String) {
        textLabel.text = "wellcome :" + text
        controller.navigationController?.popViewControllerAnimated(true)
    }
    override func  prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mySegue"{
            let vc = segue.destinationViewController as ViewController
            vc.textString = textLabel.text!
            vc.delegate = self
            
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
