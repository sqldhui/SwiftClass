//
//  View.swift
//  SwiftClassP2C6
//
//  Created by apple on 15/6/17.
//  Copyright (c) 2015年 cipnet. All rights reserved.
//

import UIKit

class View: UIView
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
//        self.multipleTouchEnabled = true
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
