//
//  ViewController.swift
//  SwiftClassP2C8
//
//  Created by apple on 15/6/29.
//  Copyright (c) 2015年 lh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var testImageView: UIImageView?
    var redView: UIView?
    var greenView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testImageView = UIImageView(frame: CGRectMake(40, 40, self.view.frame.size.width - 80, 60))
        testImageView?.backgroundColor = UIColor.blueColor()
        self.view.addSubview(testImageView!)
        
        redView = UIView(frame: CGRectMake(20, 120, self.view.frame.size.width - 40, 120))
        redView?.backgroundColor = UIColor.redColor()
        self.view.insertSubview(redView!, atIndex: 0)
        
        greenView = UIView(frame: CGRectMake(20, 120, self.view.frame.size.width - 40, 120))
        greenView?.backgroundColor = UIColor.greenColor()
        self.view.insertSubview(greenView!, atIndex: 1)
        
        var btn: UIButton = UIButton(frame: CGRectMake(60.0, self.view.frame.size.height - 60, self.view.frame.size.width - 120, 40))
        btn.backgroundColor = UIColor.lightGrayColor()
        btn.setTitle("Button", forState: .Normal)
        self.view.addSubview(btn)
        btn.addTarget(self, action: "btnClicked:", forControlEvents: .TouchUpInside)
        
//        self.simpleAnimationFadeIn()
//        self.simpleAnimationFadeOut()
//        self.simpleAnimationMoveCenter()
//        self.simpleAnimationFrame()
//        UIView.animateWithDuration(3.0, animations:
//        {
//            () -> Void in
//            testImageView?.backgroundColor = UIColor .orangeColor()
//        })
    }
    
    func btnClicked(btn: UIButton)
    {
        self.cakFly()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func simpleAnimationFadeIn()
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        testImageView?.alpha = 0.0
        UIView.commitAnimations()
    }

    func simpleAnimationFadeOut()
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        testImageView?.alpha = 1.0
        UIView.commitAnimations()
    }
    
    func simpleAnimationMoveCenter()
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        testImageView?.center = self.view.center
        UIView.setAnimationCurve(.EaseOut)
        UIView.commitAnimations()
    }
    
    func simpleAnimationFrame()
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        testImageView?.frame = CGRectMake(0.0, 60.0, 40.0, 100.0)
        UIView.setAnimationCurve(.EaseOut)
        UIView.commitAnimations()
    }
    
    func excessiveAnimation()
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1.0)
        UIView.setAnimationTransition(.CurlUp, forView: self.view, cache: true)
        self.view.exchangeSubviewAtIndex(0, withSubviewAtIndex: 1)
        UIView.commitAnimations()
    }
    func flipAnimation()
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1.0)
        UIView.setAnimationTransition(.FlipFromLeft, forView: self.view, cache: true)
        self.view.exchangeSubviewAtIndex(0, withSubviewAtIndex: 1)
        UIView.commitAnimations()
    }
    
    func caAnimationChage1()
    {
        var transition = CATransition()
        transition.duration = 1.0
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.exchangeSubviewAtIndex(0, withSubviewAtIndex: 1)
        self.view.layer.addAnimation(transition, forKey: nil)
    }
    
    func caAnimationChage2()
    {
        var transition = CATransition()
        transition.duration = 1.0
        transition.type = kCATransitionMoveIn
        transition.subtype = kCATransitionFromTop
        self.view.exchangeSubviewAtIndex(0, withSubviewAtIndex: 1)
        self.view.layer.addAnimation(transition, forKey: nil)
    }
    
    func caTranatate()
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1.0)
        testImageView?.transform = CGAffineTransformTranslate(testImageView!.transform, 2, 200)
        UIView.commitAnimations()
    }
    
    func caRotate()
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1.0)
        testImageView?.transform = CGAffineTransformRotate(testImageView!.transform, CGFloat(-M_PI / 2))
        UIView.commitAnimations()
    }
    
    func caScale()
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1.0)
        testImageView?.transform = CGAffineTransformScale(testImageView!.transform, 1.5, 1.5)
        UIView.commitAnimations()
    }
    
    func caInvert()
    {
        testImageView?.transform = CGAffineTransformIdentity
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        testImageView?.transform = CGAffineTransformConcat(testImageView!.transform, CGAffineTransformInvert(testImageView!.transform))
        UIView.commitAnimations()
    }
    
    func cabOpacity()
    {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation!.fromValue = 1.0
        animation!.toValue = 0.0
        animation.duration = 3.0
        testImageView?.layer.addAnimation(animation, forKey: "Image-opacity")
        
    }
    
    func cabExpend()
    {
        let animation = CABasicAnimation(keyPath: "bounds.size")
        animation!.fromValue = NSValue(CGSize: CGSizeMake(2.0, 2.0))
        animation!.toValue = NSValue(CGSize: CGSizeMake(testImageView!.frame.size.width, testImageView!.frame.size.height))
        animation.duration = 3.0
        testImageView?.layer.addAnimation(animation, forKey: "Image-expen")
    }
    
    func cakFly()
    {
        let animation = CAKeyframeAnimation(keyPath: "position")
        let p1 = CGPoint(x: 0.0, y: 20.0)
        let p2 = CGPoint(x: 320.0, y: 0.0)
        let p3 = CGPoint(x: 320.0, y: 480.0)
        let p4 = CGPoint(x: 0.0, y: 480.0)
        let p5 = CGPoint(x: 160.0, y: 200.0)
        
        animation.values = [NSValue(CGPoint: p1), NSValue(CGPoint: p2), NSValue(CGPoint: p3), NSValue(CGPoint: p4), NSValue(CGPoint: p5)]
        animation.keyTimes = [NSNumber(float: 0.0), NSNumber(float: 0.4), NSNumber(float: 0.6), NSNumber(float: 0.8), NSNumber(float: 1.0)]
        animation.delegate = self
        animation.duration = 5.0
        testImageView?.layer.addAnimation(animation, forKey: "Image-Fly")
    }
    
    override func animationDidStart(anim: CAAnimation!)
    {
        println("\(anim) start")
    }
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool)
    {
        println("\(anim) did stop")
    }
}

