//
//  ViewController.swift
//  textSegue
//
//  Created by student on 10/24/14.
//  Copyright (c) 2014 two. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    
    @IBOutlet weak var textLabel: UILabel!
    
   
    func myVCidFinish(controller: ViewController, text: String) {
        textLabel.text = "wellcome :" + text
        controller.navigationController?.popViewControllerAnimated(true)
    }
    override func  prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mySegue"{
            let vc = segue.destinationViewController as ViewController
            
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }


}

