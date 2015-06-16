//
//  BarViewController.swift
//  SwiftClassP2C4
//
//  Created by apple on 15/6/16.
//  Copyright (c) 2015年 lh. All rights reserved.
//

import UIKit

class BarViewController: UIViewController, UISearchBarDelegate
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.grayColor()
        
        var toolBar: UIToolbar = UIToolbar(frame: CGRectMake(0, self.view.frame.size.height - 40, self.view.frame.size.width, 40))
        self.view.addSubview(toolBar)
        toolBar.barStyle = .Default
        toolBar.tintColor = UIColor.greenColor()
        toolBar.barTintColor = UIColor.yellowColor()
        toolBar.backgroundColor = UIColor.orangeColor()
        
        var flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: "", action: nil)
        var backItem = UIBarButtonItem(title: "返回", style: .Plain, target: self, action: "backBtnClicked:")
        toolBar.items = [flexibleSpace, backItem]
        
        var searchBar = UISearchBar(frame: CGRectMake(0, 20, self.view.frame.size.width, 60))
        self.view.addSubview(searchBar)
        searchBar.barStyle = .Default
        searchBar.delegate = self
        searchBar.text = "search something"
        searchBar.prompt = "search tip"
        searchBar.placeholder = "please input"
        searchBar.showsBookmarkButton = true
        searchBar.searchResultsButtonSelected = true
        searchBar.tintColor = UIColor.blueColor()
        searchBar.scopeButtonTitles = ["111111", "2222222", "333333"]
        searchBar.selectedScopeButtonIndex = 2
        searchBar.showsScopeBar = true
    }
    
    func backBtnClicked(sender: AnyObject)
    {
        println((__FUNCTION__))
    }
}
