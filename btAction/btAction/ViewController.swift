//
//  ViewController.swift
//  btAction
//
//  Created by student on 11/21/14.
//  Copyright (c) 2014 app. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation

class ViewController: UIViewController {
        
    var audioPlayer = AVAudioPlayer()
    var text = "รักแรกพบ"
    
    @IBAction func button1(sender: AnyObject) {
        audioPlayer.play()
    }
    @IBAction func button2(sender: AnyObject) {
        audioPlayer.stop()
    }
    @IBAction func button3(sender: AnyObject) {
        text = "mr5"
        var url1 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(text, ofType: "mp3")!)
        coreAudio()
        audioPlayer.play()
    }
    
    func coreAudio(){
        var url1 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(text, ofType: "mp3")!)
        var error: NSError?
        
        audioPlayer = AVAudioPlayer(contentsOfURL: url1, error: &error)
        audioPlayer.prepareToPlay()
        //audioPlayer.play()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coreAudio()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

