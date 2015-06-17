//
//  ViewController.swift
//  SwiftClassP2C6
//
//  Created by apple on 15/6/17.
//  Copyright (c) 2015年 cipnet. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.userInteractionEnabled = true
        self.view.multipleTouchEnabled = true
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        let numTouches = touches.count
        println((numTouches))
        
        let tapTouches = (touches as NSSet).anyObject()?.tapCount
        println((tapTouches))
        
        let timestamp = event.timestamp
        println((timestamp))
        
        let locationPoint = (touches as NSSet).anyObject()?.locationInView(self.view)
        println((locationPoint))
        
        let previousPoint = (touches as NSSet).anyObject()?.previousLocationInView(self.view)
        println((previousPoint))
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        let locationPoint = (touches as NSSet).anyObject()?.locationInView(self.view)
        println((locationPoint))
        
        let previousPoint = (touches as NSSet).anyObject()?.previousLocationInView(self.view)
        println((previousPoint))
    }
}

