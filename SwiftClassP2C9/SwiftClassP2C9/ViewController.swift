//
//  ViewController.swift
//  SwiftClassP2C9
//
//  Created by apple on 15/6/29.
//  Copyright (c) 2015年 lh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var label = UILabel(frame: CGRectMake(20, 20, self.view.frame.size.width - 40, 30))
        self.view.addSubview(label)
        
        var label2 = UILabel(frame: CGRectMake(20, 60, self.view.frame.size.width - 40, 30))
        self.view.addSubview(label2)
        
        if Reachability.isConnectedToNetwork()
        {
            label.text = "Y"
        }
        else
        {
            label.text = "N"
        }
        
        let type = Reachability.isConnectedToNetworkOfType()
        switch type
        {
        case .WWAN:
            label2.text = "WWAN"
        case .WiFi:
            label2.text = "WiFi"
        case .NotConnected:
            label2.text = "N"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

