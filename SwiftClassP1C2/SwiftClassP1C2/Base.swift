//
//  Base.swift
//  SwiftClassP1C2
//
//  Created by apple on 15/6/12.
//  Copyright (c) 2015年 lh. All rights reserved.
//

class Base
{
    var baseName: String
    var baseTag: Int
    func getBaseName() -> String
    {
        return baseName
    }
    
    init()
    {
        baseName = "Base Class"
        baseTag = 1
    }
}

class SubClass: Base
{
    func getSubName() -> String
    {
        return getBaseName() + "的子类"
    }
}
