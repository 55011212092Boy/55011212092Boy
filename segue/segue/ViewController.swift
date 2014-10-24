//
//  ViewController.swift
//  segue
//
//  Created by student on 10/17/14.
//  Copyright (c) 2014 two. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ColorTwoViewControllerDelegate {

  
    @IBOutlet var colorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func  myVCDidFinish(controller: colorTwoViewController, text: String) {
        colorLabel.text = "Color : " +  text
        if(text=="Red"){
            colorLabel.backgroundColor = UIColor.redColor()
        }
        else if(text=="Green"){
            colorLabel.backgroundColor = UIColor.greenColor()
        }
        else if(text=="Blue"){
            colorLabel.backgroundColor = UIColor.blueColor()
        }
        
        controller.navigationController?.popViewControllerAnimated(true)
    }
    
    override func prepareForSegue(segue:UIStoryboardSegue,sender:AnyObject!){
        if segue.identifier == "mySegue"{
            let vc = segue.destinationViewController as colorTwoViewController
            vc.colorString = colorLabel.text!
            vc.delegate = self
        }
    }

    
}

