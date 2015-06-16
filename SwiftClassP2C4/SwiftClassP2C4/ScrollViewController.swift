//
//  ScrollViewController.swift
//  SwiftClassP2C4
//
//  Created by apple on 15/6/16.
//  Copyright (c) 2015年 lh. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        var scrollView = UIScrollView(frame: CGRectMake(20, 60, self.view.frame.size.width - 40, 200))
        scrollView.backgroundColor = UIColor.grayColor()
        self.view.addSubview(scrollView)
        
        let width = scrollView.frame.size.width
        let height = scrollView.frame.size.height
        
        var view1 = UIView(frame: CGRectMake(0, 0, width, height))
        view1.backgroundColor = UIColor.orangeColor()
        scrollView.addSubview(view1)
        
        var view2 = UIView(frame: CGRectMake(width, 0, width, height))
        view2.backgroundColor = UIColor.yellowColor()
        scrollView.addSubview(view2)
        
        var view3 = UIView(frame: CGRectMake(width * 2, 0, width, height))
        view3.backgroundColor = UIColor.redColor()
        scrollView.addSubview(view3)
        
        scrollView.contentSize = CGSizeMake(width * 3, height)
        
        scrollView.indicatorStyle = .Default
        
        scrollView.pagingEnabled = true
        
        
        var pageCtrl: UIPageControl = UIPageControl(frame: CGRectMake(20, 300, width, height))
        pageCtrl.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(pageCtrl)
        pageCtrl.numberOfPages = 3
        pageCtrl.currentPage = 0
    }
}
