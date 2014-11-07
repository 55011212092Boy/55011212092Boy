//
//  ViewController.swift
//  animateTest
//
//  Created by student on 11/7/14.
//  Copyright (c) 2014 app. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let container = UIView()
    let redSquare = UIView()
    let blueSquare = UIView()

    
    @IBAction func animateButtonTapped(sender: AnyObject) {
        

        let views = (frontView: self.redSquare, backView: self.blueSquare)
        let transitionOptions = UIViewAnimationOptions.TransitionCurlUp
        
        UIView.transitionWithView(self.container, duration: 1.0, options: transitionOptions, animations: {
            // remove the front object...
            views.frontView.removeFromSuperview()
            
            // ... and add the other object
            self.container.addSubview(views.backView)
            
            }, completion: { finished in
               
        })
        
        /*var views : (frontView: UIView, backView: UIView)
        
        if(self.redSquare.superview){
            views = (frontView: self.redSquare, backView: self.blueSquare)
        }
        else {
            views = (frontView: self.blueSquare, backView: self.redSquare)
        }*/
        
        //let transitionOptions = UIViewAnimationOptions.TransitionCurlUp
        //let transitionOptions = UIViewAnimationOptions.TransitionCurlDown
        //let transitionOptions = UIViewAnimationOptions.TransitionFlipFromLeft
        
        //UIView.transitionFromView(views.frontView, toView: views.backView, duration: 1.0, options: transitionOptions, completion: nil)
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.container.frame = CGRect(x: 60, y: 60, width: 200, height: 200)
        self.view.addSubview(container)
        
        self.redSquare.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.blueSquare.frame = redSquare.frame
        
        self.redSquare.backgroundColor = UIColor.redColor()
        self.blueSquare.backgroundColor = UIColor.blueColor()
        
        self.container.addSubview(self.redSquare)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

