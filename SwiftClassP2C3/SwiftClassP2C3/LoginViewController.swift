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
