//
//  ViewController.swift
//  SwiftClassP1C1F3
//
//  Created by apple on 15/6/11.
//  Copyright (c) 2015年 lh. All rights reserved.
//

import UIKit

let iPHONE4_DEV: Bool! = (UIScreen.mainScreen().bounds.size.height == 480 ? true : false)
let iPHONE5_DEV: Bool! = (UIScreen.mainScreen().bounds.size.height == 568 ? true : false)
let iPHONE6_DEV: Bool! = (UIScreen.mainScreen().bounds.size.height == 667 ? true : false)
let iPHONE6P_DEV: Bool! = (UIScreen.mainScreen().bounds.size.height == 736 ? true : false)

extension Double
{
    //转换(四舍五入)
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
        @IBAction func btnClicked(sender: UIButton) {
        }
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
        
        var numStr: String = "123"
        var value1: Int? = numStr.toInt()
        println(value1)
        
        var value2: Int! = numStr.toInt()
        println(value2 + 6)
        
        let v1 = 10_000_000
        println(v1)
        
        //typealias 类型别名 = 原始类型
        typealias NewInt = Int32
        var new_value: NewInt = 123
        
        //基本类型转换
        var j: Int = 3
        Double(j)//3.0
        Float(j)//3.0
        println("\(j)")
        println("\(Double(j))")
        println("\(Float(j))")
        
        /*
        *当字符串第一位不为数字时, 转为0
        *当字符串第一位为数字时, 直接转换为数字, 直到遇到非数字自负停止
*/
        var s: String = "2.156asd2"
        println(s.toInt())
        var s1 = s as NSString
        println(s1)
        println(s1.integerValue)
        println(s1.doubleValue)
        println(s1.floatValue)
        
        //运算符与表达式
        var newString = "hello, " + "world"
        var newString2 = ", swift"
        let endChar: Character = "!"
        println(newString + newString2)
        
        println(1...5)
        for index in 1...5
        {
            print("index \(index); ")
        }
        println()
        println(1..<5)
        for index in 1..<5
        {
            print("index \(index); ")
        }
        println()
        
        //控制流
        let count = 3_000
        var naturalThings: String
        switch count
        {
        case 0: naturalThings = "数字0"
        case 1...3: naturalThings = "数字1-3"
        case 4...9: naturalThings = "数字4-9"
        case 10...99: naturalThings = "数字10-99"
        case 100...9999: naturalThings = "数字100-9999"
        default: naturalThings = "9999以上"
        }
        println(naturalThings)
        
        let number = 5
        switch number
        {
        case 2,5,5,7:
            println("这是一个质数")
            fallthrough
        case 5:
            println("5")
        default:
            println("这是一个整数")
        }
        println(description)
        
        enum MapDirection
        {
            case North
            case South
            case East
            case West
            func simpleDescription() -> String
            {
                switch self
                {
                case .North: return "North"
                case .South: return "South"
                case .East: return "East"
                case .West: return "West"
                default: return String("unknow")
                }
            }
        }
        var directionToHead = MapDirection.West
        
        println(directionToHead.simpleDescription())
        
        struct Summation
        {
            var addend: Int
            var augend: Int
            func sum() -> Int
            {
                return addend + augend
            }
        }
        let newStruct = Summation(addend: 6, augend: 8)
        println(newStruct.sum())
        
        println((UIScreen.mainScreen().bounds.size.height))
        println((iPHONE4_DEV))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

