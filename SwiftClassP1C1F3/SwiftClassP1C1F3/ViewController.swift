//
//  ViewController.swift
//  SwiftClassP1C1F3
//
//  Created by apple on 15/6/11.
//  Copyright (c) 2015年 lh. All rights reserved.
//

import UIKit

extension Double
{
    //转换
    func format(f: String) -> String
    {
        return NSString(format: "%\(f)f", self) as String
    }
}

class ViewController: UIViewController {
    
    //let 声明常量
    let c: Int = 10
    let 身高 = 183
    let 😄 = "😃"
    
    //var声明变量
    var myVar = "我的变量"
    var 我的: String = ""
    var my: Int = 0
    
    func testFunc()
    {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //print 输出后不换行
        print("Welcome Swift Class!")
        //print 输出后换行
        println("身高 \(身高); 😄 \(😄)")
        
        testFunc()
        
        /*
        与当前机器环境字长相同的整型/无符号整型 Int/UInt
        整型 Int8, Int16, Int32, Int64
        无符号整型 UInt8, UInt16, UInt32, UInt64
        * Int/UInt 提高代码可移植性
*/
        
        /*
        Double, Float
*/
        let n1: Double = 3.145926
        let n2: Float = 3.14
        
        println(n1)
        println(n2)
        
        println(n1.format(".2"))
        
        var isBool: Bool = true
        if isBool
        {
            println("isBool is true")
        }
        else
        {
            
        }
        
        /*
        Character, String
*/
        var emptyString1 = ""
        var emptyString2 = String()
        
        var str1 = "abc"
        var str2 = String("abc")
        
        let charSet = "获取每一个字符"
        for c in charSet
        {
            println(c)
        }
        
        let product1 = (2015, "iPhone", 6088)
        println(product1)
        var (_year, _name, _price) = product1
        println("year=\(_year) name=\(_name) price=\(_price)")
        let (_,name1,_) = product1
        println("name1=\(name1)")
        
        let product2 = (year:2014, name:"iPhone", price:6088)
        println(product2.year)
        println(product2.name)
        println(product2.price)
        
        /*
        可选类型
*/
        var stringValue: String?
        if (stringValue != nil)
        {
            println("stringValue 存在值")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

