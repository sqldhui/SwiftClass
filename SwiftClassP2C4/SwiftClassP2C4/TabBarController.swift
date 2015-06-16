//
//  TabBarController.swift
//  SwiftClassP2C4
//
//  Created by apple on 15/6/16.
//  Copyright (c) 2015年 lh. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        var ctrl1 = ViewController()
        var ctrl2 = ListViewController()
        var ctrl3 = ScrollViewController()
        var ctrl4 = WebViewController()
        var ctrl5 = PickerViewController()
        
        self.addChildViewController(ctrl1)
        self.addChildViewController(ctrl2)
        self.addChildViewController(ctrl3)
        self.addChildViewController(ctrl4)
        self.addChildViewController(ctrl5)
        
        var item1 = UITabBarItem(title: "View", image: nil, selectedImage: nil)
        var item2 = UITabBarItem(title: "List", image: nil, selectedImage: nil)
        var item3 = UITabBarItem(title: "Scroll", image: nil, selectedImage: nil)
        var item4 = UITabBarItem(title: "Web", image: nil, selectedImage: nil)
        var item5 = UITabBarItem(title: "Picker", image: nil, selectedImage: nil)
        
        ctrl1.tabBarItem = item1
        ctrl2.tabBarItem = item2
        ctrl3.tabBarItem = item3
        ctrl4.tabBarItem = item4
        ctrl5.tabBarItem = item5  
    }

}
