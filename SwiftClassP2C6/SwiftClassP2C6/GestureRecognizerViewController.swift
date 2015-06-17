//
//  GestureRecognizerViewController.swift
//  SwiftClassP2C6
//
//  Created by apple on 15/6/17.
//  Copyright (c) 2015年 cipnet. All rights reserved.
//

import UIKit

/*
    UITapGestureRecognizer          //点击
    UIPanGestureRecognizer          //拖移, 慢速移动
    UILongPressGestureRecognizer    //长按
    UIPinchGestureRecognizer        //捏合
    UIRotationGestureRecognizer     //旋转
    UISwipeGestureRecognizer        //轻扫, 快速移动
*/

class GestureRecognizerViewController: UIViewController
{
    override func viewDidLoad()
    {
        //tap
        var atap = UITapGestureRecognizer(target: self, action: "tapDo:")
        self.view.addGestureRecognizer(atap)
        atap.numberOfTapsRequired = 1
        
        //pan
        var aPan = UIPanGestureRecognizer(target: self, action: "panDo:")
        self.view.addGestureRecognizer(aPan)
        aPan.minimumNumberOfTouches = 1
        aPan.maximumNumberOfTouches = 3
        
        //long press
        var aLongPress = UILongPressGestureRecognizer(target: self, action: "longPressDo:")
        self.view.addGestureRecognizer(aLongPress)
        aLongPress.minimumPressDuration = 1
        
        //pinch
        var aPinch = UIPinchGestureRecognizer(target: self, action: "pinchDo:")
        self.view.addGestureRecognizer(aPinch)
        
        //rotation
        var aRotation = UIRotationGestureRecognizer(target: self, action: "rotationDo:")
        self.view.addGestureRecognizer(aRotation)
        
        //swipe
        var aSwipe = UISwipeGestureRecognizer(target: self, action: "swipeDo:")
        self.view.addGestureRecognizer(aSwipe)
        aSwipe.direction = .Left
    }
    
    func tapDo(sender: UITapGestureRecognizer)
    {
        println((__FUNCTION__))
    }
    
    func panDo(sender: UIPanGestureRecognizer)
    {
        println((__FUNCTION__))
    }
    
    func longPressDo(sender: UILongPressGestureRecognizer)
    {
        println((__FUNCTION__))
    }
    
    func pinchDo(sender: UIPinchGestureRecognizer)
    {
        println((__FUNCTION__))
    }
    
    func rotationDo(UIRotationGestureRecognizer)
    {
        println((__FUNCTION__))
    }
    
    func swipeDo(UISwipeGestureRecognizer)
    {
        println((__FUNCTION__))
    }
}
