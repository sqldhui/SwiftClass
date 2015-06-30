//
//  ViewController.swift
//  SwiftClassP2C10
//
//  Created by apple on 15/6/30.
//  Copyright (c) 2015年 lh. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    var motionManager: CMMotionManager = CMMotionManager()
    
    var xLabel: UILabel?
    var yLabel: UILabel?
    var zLabel: UILabel?
    
    var orientationLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        xLabel = UILabel(frame: CGRectMake(20, 20, self.view.frame.size.width - 40, 30))
        self.view.addSubview(xLabel!)
        
        yLabel = UILabel(frame: CGRectMake(20, 60, self.view.frame.size.width - 40, 30))
        self.view.addSubview(yLabel!)
        
        zLabel = UILabel(frame: CGRectMake(20, 100, self.view.frame.size.width - 40, 30))
        self.view.addSubview(zLabel!)
        
        orientationLabel = UILabel(frame: CGRectMake(20, 140, self.view.frame.size.width - 40, 30))
        self.view.addSubview(orientationLabel!)
        
        motionManager.accelerometerUpdateInterval = 0.1
        if motionManager.accelerometerAvailable
        {
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler:
            {
                (var accelerometerData: CMAccelerometerData?, var error: NSError?) -> Void in
                if error != nil
                {
                    self.motionManager.stopAccelerometerUpdates()
                }
                else
                {
                    self.xLabel?.text = "x: \(accelerometerData!.acceleration.x)"
                    self.yLabel?.text = "y: \(accelerometerData!.acceleration.y)"
                    self.zLabel?.text = "z: \(accelerometerData!.acceleration.z)"
                }
            })
        }
        else
        {
            println("not support motion manager")
        }
        
        UIDevice.currentDevice().beginGeneratingDeviceOrientationNotifications()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedRotation", name: UIDeviceOrientationDidChangeNotification, object: nil)
    }
    
    func receivedRotation()
    {
        var device = UIDevice.currentDevice()
        switch device.orientation
        {
        case .Unknown:
            orientationLabel?.text = "Unknown"
        case .Portrait:
            orientationLabel?.text = "Portrait"
        case .PortraitUpsideDown:
            orientationLabel?.text = "PortraitUpsideDown"
        case .LandscapeLeft:
            orientationLabel?.text = "LandscapeLeft"
        case .LandscapeRight:
            orientationLabel?.text = "LandscapeRight"
        case .FaceUp:
            orientationLabel?.text = "FaceUp"
        case .FaceDown:
            orientationLabel?.text = "FaceDown"
        }
    }
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent)
    {
        println("motion began")
    }
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent)
    {
        println("motion end")
    }
    override func motionCancelled(motion: UIEventSubtype, withEvent event: UIEvent)
    {
        println("motion cancel")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

