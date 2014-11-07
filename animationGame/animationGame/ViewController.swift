//
//  ViewController.swift
//  animationGame
//
//  Created by student on 11/7/14.
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
    
    func collisionBehavior(behavior: UICollisionBehavior!, beganContactForItem item: UIDynamicItem!, withBoundaryIdentifier identifier: NSCopying!, atPoint p: CGPoint) {
        
        println("Boundary contact occurred - \(identifier)")
        
        let collidingView = item as UIView
        collidingView.backgroundColor = UIColor.yellowColor()
        UIView.animateWithDuration(0.5){
            collidingView.backgroundColor = UIColor.blueColor()
        }
        var firstContact = false
        if(!firstContact){
            firstContact = true
            
            let square = UIView(frame: CGRect(x:self.view.frame.origin.x + self.square.frame.origin.x, y: self.view.frame.origin.y + self.square.frame.origin.y,width:10,height:10))
            square.backgroundColor = getRandomColor()
            view.addSubview(square)
            
            collision.addItem(square)
            gravity.addItem(square)
            
            let attach = UIAttachmentBehavior(item: collidingView, attachedToItem:square)
            animator.addBehavior(attach)
        }
    }
    
    func getRandomColor() -> UIColor{
        
        var randomRed:CGFloat = CGFloat(drand48())
        var randomGreen:CGFloat = CGFloat(drand48())
        var randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    
    func panning(pan:UIPanGestureRecognizer){//ลากสี่เหลี่ยม
        println("Our box is panning...")
        var location = pan.locationInView(self.view)
        var touchLocation = pan.locationInView(self.square)
        if pan.state == UIGestureRecognizerState.Began{
            
            self.animator!.removeAllBehaviors()
            self.square!.center = location;
        }else if pan.state == UIGestureRecognizerState.Changed{
            self.square!.center = location;
        }else if pan.state == UIGestureRecognizerState.Ended{
            self.animator!.addBehavior(self.gravity)
            self.animator!.addBehavior(self.collision)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barrier = UIView(frame: CGRect(x:0,y:300,width:130,height:20))
        barrier.backgroundColor = UIColor.redColor()
        view.addSubview(barrier)
       
        square = UIView(frame: CGRect(x:100,y:100,width:50,height:50))
        square.backgroundColor = UIColor.greenColor()
        view.addSubview(square)
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [square])
        //collision = UICollisionBehavior(items: [square,barrier])//barrier ถ้าเป็น collision ชนกันจะเด้ง
        collision.addBoundaryWithIdentifier("barrier", forPath: UIBezierPath(rect: barrier.frame))//โดนชนแล้วก็อยู่เฉยๆ
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.action = {println("\(NSStringFromCGAffineTransform(self.square.transform)) \(NSStringFromCGPoint(self.square.center))")}

        animator.addBehavior(collision)
        
        collision.collisionDelegate = self
        
        //ชนแล้วเด้ง
        let itemBehaviour = UIDynamicItemBehavior(items: [square])
        itemBehaviour.elasticity = 0.5
        animator.addBehavior(itemBehaviour)
        
        self.panGesture = UIPanGestureRecognizer(target: self, action: "panning:")
        self.square!.addGestureRecognizer(panGesture)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesEnded(touches:NSSet, withEvent event:UIEvent){
        if(snap != nil){
            animator.removeBehavior(snap)
        }
        
        let touch = touches.anyObject() as UITouch
        snap = UISnapBehavior(item: square, snapToPoint: touch.locationInView(view))
        animator.addBehavior(snap)
    }

}

