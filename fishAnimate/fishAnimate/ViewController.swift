//
//  ViewController.swift
//  fishAnimate
//
//  Created by student on 11/7/14.
//  Copyright (c) 2014 app. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func animateButton(sender: AnyObject) {
        
        /*let coloredSquare = UIView()
        
        coloredSquare.backgroundColor = UIColor.blueColor()
       
        coloredSquare.frame = CGRect(x:0, y:120, width:50, height:50)
        
      
        self.view.addSubview(coloredSquare)
        
        
        UIView.animateWithDuration(1.0, animations: {
            coloredSquare.backgroundColor = UIColor.redColor()
        
            coloredSquare.frame = CGRect(x: 320-50, y: 120, width: 50, height: 50)
            
        })*/
        
        
        for loopNumber in 0...10 {
            
            // set up some constants for the animation
            
            let duration : NSTimeInterval = 1.0
            //let delay : NSTimeInterval = 0.0
            let delay =  NSTimeInterval( ((Int(rand()) %  900)+100.0) / 1000.0)
            let options = UIViewAnimationOptions.CurveLinear
            
            // set up some constants for the fish
            let size : CGFloat = CGFloat( Int(rand()) %  40 + 20.0)
            let yPosition : CGFloat = CGFloat( Int(rand()) %  200 + 20.0)
            
            // create the fish and add it to the screen
            let fish = UIImageView()
            fish.image = UIImage(named: "blue-fish.png")
            fish.frame = CGRectMake(0-size, yPosition, size, size)
            //fish.frame = CGRectMake(0, yPosition, size, size)
            //fish.frame = CGRectMake(320, yPosition, size, size)
            self.view.addSubview(fish)
            
            // define the animation
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                
                // move the fish
                fish.frame = CGRectMake(320-size, yPosition, size, size)
                
                }, completion: { animationFinished in
                    
                    // remove the fish
                    fish.removeFromSuperview()
                    
            })
        }
        
        
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

