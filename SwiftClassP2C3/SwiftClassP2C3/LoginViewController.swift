//
//  LoginViewController.swift
//  SwiftClassP2C3
//
//  Created by LiHui on 15/6/13.
//  Copyright (c) 2015年 LH. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var button1: UIButton!
        button1 = UIButton(frame: CGRectZero)
        button1.setTitle("按钮", forState: .Normal)
        button1.backgroundColor = UIColor.redColor()
        button1.sizeToFit()
        button1.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(button1)
        
        var leftBtn: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        leftBtn.backgroundColor = UIColor(red: 0.8, green: 1.0, blue: 0.4, alpha: 1.0)
        self.view.addSubview(leftBtn)
        leftBtn.tag = 19
        
        var rightBtn: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        rightBtn.backgroundColor = UIColor(red: 0.8, green: 0.9, blue: 0.3, alpha: 1.0)
        self.view.addSubview(rightBtn)
        rightBtn.tag = 19
        
        var bottomBtn: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        bottomBtn.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.8, alpha: 1.0)
        self.view.addSubview(bottomBtn)
        bottomBtn.tag = 19
        bottomBtn.setTitle("取消", forState: .Normal)
        bottomBtn.addTarget(self, action: "cancelAutoLayout", forControlEvents: UIControlEvents.TouchUpInside)
        
        leftBtn.setTranslatesAutoresizingMaskIntoConstraints(false)
        rightBtn.setTranslatesAutoresizingMaskIntoConstraints(false)
        bottomBtn.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        var views: NSMutableDictionary = NSMutableDictionary()
        views.setValue(leftBtn, forKey: "LeftBtn")
        views.setValue(rightBtn, forKey: "RightBtn")
        views.setValue(bottomBtn, forKey: "BottomBtn")
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[LeftBtn]-20-[RightBtn(==LeftBtn)]-20-|", options: nil, metrics: nil, views: views as [NSObject : AnyObject]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[BottomBtn]-20-|", options: nil, metrics: nil, views: views as [NSObject: AnyObject]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-40-[LeftBtn]-20-[BottomBtn(==LeftBtn)]-20-|", options: nil, metrics: nil, views: views as [NSObject: AnyObject]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-40-[RightBtn]-20-[BottomBtn(==LeftBtn)]-20-|", options: nil, metrics: nil, views: views as [NSObject: AnyObject]))
    }
    
    @IBAction func btnClicked(sender: UIButton)
    {
        label.text = "Test Success"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
