//
//  WebViewController.swift
//  SwiftClassP2C4
//
//  Created by apple on 15/6/16.
//  Copyright (c) 2015年 lh. All rights reserved.
//

import UIKit

class WebViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.grayColor()
        
        var webView: UIWebView = UIWebView(frame: CGRectMake(20, 40, self.view.frame.size.width - 40, self.view.frame.size.height - 80))
        webView.backgroundColor = UIColor.darkGrayColor()
        self.view.addSubview(webView)
        
        let webString = "http://www.baidu.com"
        var url: NSURL = NSURL(string: webString)!
        var request: NSURLRequest = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }
}
