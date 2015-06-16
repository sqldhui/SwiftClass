//
//  NavigationViewController.swift
//  SwiftClassP2C4
//
//  Created by apple on 15/6/16.
//  Copyright (c) 2015年 lh. All rights reserved.
//

import UIKit

class NavigationViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.grayColor()
        self.title = "Title"
        self.navigationController?.navigationBar.barTintColor = UIColor.greenColor()
        self.navigationController?.navigationBar.tintColor = UIColor.orangeColor()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: nil, action: nil)
        var btn = UIButton(frame: CGRectMake(0, 0, 60, 30))
        btn.setTitle("Button", forState: UIControlState())
        self.navigationItem.titleView = btn
        self.navigationController?.toolbarHidden = false
    }
}
