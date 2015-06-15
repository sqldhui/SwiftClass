//
//  ViewController.swift
//  SwiftClassP2C4
//
//  Created by apple on 15/6/14.
//  Copyright (c) 2015年 lh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        var screenBounds: CGRect = UIScreen.mainScreen().bounds
        println((screenBounds))
        
        var viewBounds: CGRect = UIScreen.mainScreen().applicationFrame
        println((viewBounds))
        
        var nameLabel: UILabel  = UILabel(frame: CGRectMake(20, 100, 130, 60));
        nameLabel.backgroundColor = UIColor.redColor()
        self.view.addSubview(nameLabel)
        nameLabel.text = "这是一个label"
        nameLabel.font = UIFont.systemFontOfSize(18)
        nameLabel.textColor = UIColor.blueColor()
        nameLabel.shadowColor = UIColor.yellowColor()
        nameLabel.shadowOffset = CGSizeMake(2, 1)
        nameLabel.textAlignment = .Center
        nameLabel.baselineAdjustment = .AlignBaselines
        
        var comLabel: UILabel  = UILabel(frame: CGRectMake(160, 100, 130, 60));
        comLabel.backgroundColor = UIColor.redColor()
        self.view.addSubview(comLabel)
        comLabel.text = "这是一个label"
        comLabel.font = UIFont.systemFontOfSize(18)
        comLabel.textColor = UIColor.blueColor()
        comLabel.shadowColor = UIColor.yellowColor()
        comLabel.shadowOffset = CGSizeMake(2, 1)
        comLabel.textAlignment = .Center
        comLabel.baselineAdjustment = .AlignCenters
        
        var stepperView: UIStepper = UIStepper(frame: CGRectMake(200, 200, 80, 40))
        self.view.addSubview(stepperView)
        println("min: \(stepperView.minimumValue); max: \(stepperView.maximumValue); current: \(stepperView.value)")
        
        var progressView: UIProgressView = UIProgressView(frame: CGRectMake(20, 260, 200, 20))
        self.view.addSubview(progressView)
        progressView.progress = 0.5
        progressView.progressViewStyle = .Bar
        progressView.progressImage = UIImage(named: "track")
        progressView.trackImage = UIImage(named: "bar")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

