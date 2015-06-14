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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

