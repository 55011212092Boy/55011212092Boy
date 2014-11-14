//
//  ViewController.swift
//  gameDog
//
//  Created by student on 11/14/14.
//  Copyright (c) 2014 app. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollisionBehaviorDelegate {
    
    var square:UIView!
    var animator:UIDynamicAnimator!
    var gravity:UIGravityBehavior!
    var collision:UICollisionBehavior!
    var snap:UISnapBehavior!
    var panGesture:UIPanGestureRecognizer!
    
    @IBAction func animate(sender: AnyObject) {
    
    
            let duration : NSTimeInterval = 1.0
                //let delay : NSTimeInterval    = 0.0
                let delay =  NSTimeInterval( ((Int(rand()) %  900)+100.0) / 1000.0)
                let options = UIViewAnimationOptions.CurveLinear
    
                // set up some constants for the fish
                let size : CGFloat = CGFloat( Int(rand()) %  40 + 20.0)
                let yPosition : CGFloat = CGFloat( Int(rand()) %  200 + 20.0)
    
                // create the fish and add it to the screen
                let dog = UIImageView()
                dog.image = UIImage(named: "ddog.png")
                dog.frame = CGRectMake(0-size, yPosition, size, size)
                //fish.frame = CGRectMake(0, yPosition, size, size)
                //fish.frame = CGRectMake(320, yPosition, size, size)
                self.view.addSubview(dog)
    
                // define the animation
                UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
    
                    // move the fish
                    dog.frame = CGRectMake(320-size, yPosition, size, size)
    
                    }, completion: { animationFinished in
    
                        // remove the fish
                        dog.removeFromSuperview()
    
                })
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg"))
        
        let size : CGFloat = CGFloat( Int(rand()) %  40 + 20.0)
        
         let dog = UIImageView()
         dog.image = UIImage(named: "ddog.png")
          dog.frame = CGRectMake(20, 60, size, size)
        gravity = UIGravityBehavior(items: [dog])
        self.view.addSubview(dog)
        

        
        
        let dog2 = UIImageView()
        dog2.image = UIImage(named: "dog2.png")
        dog2.frame = CGRectMake(20, 90, size, size)
        self.view.addSubview(dog2)
        
   
        
        
        
       

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

