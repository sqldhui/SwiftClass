//
//  ViewController.swift
//  SwiftClassP1C2
//
//  Created by apple on 15/6/12.
//  Copyright (c) 2015年 lh. All rights reserved.
//

import UIKit

class SomeClass
{
    var value1 = 1
    var value2: Int = 2
    var cal: Int
    {
        get{return value1 + value2}
        set(newValue){value2 = newValue}
    }
    class var newValue: Int
    {
        return 10
    }
    
    var teachers: Int = 0
    {
        willSet(newTeachers)
        {
            println("新增加老师 \(newTeachers)")
        }
        didSet(old)
        {
            if teachers > old
            {
                println("与原来相比增加了 \(teachers - old) 位老师")
            }
        }
    }
}

class GameRules
{
    var score = 0
    func additive()
    {
        score += 1
        println((__FUNCTION__) + " score: \(score)")
    }
    
    func subtraction(amount: Int)
    {
        score -= amount
        println((__FUNCTION__) + " score: \(score)")
    }
    
    func reset()
    {
        score = 0
        println((__FUNCTION__) + " score: \(score)")
    }
    
    class func showName()
    {
        println("GameRules")
    }
}
class SomeGame: GameRules
{
    override class func showName()
    {
        println("SomeGame")
    }
}

class NewClass
{
    var count: Int = 100
    func printCount()
    {
        var count: Int = 50
        println((count))
        println((self.count))
        @IBAction func btnClicked(sender: UIButton) {
        }
    }
}

class Experience
{
    var age: [Int] = Array(count: 5, repeatedValue: 0)
    subscript(index: Int) -> Int
    {
        get {return age[index]}
        set {age[index] = newValue}
    }
}

func additive(a: Int, b: Int) -> Int
{
    return a + b
}
func multiplication(a: Int, b: Int) -> Int
{
    return a * b
}
func printAdditiveResult(addFun: (Int, Int) -> Int, a: Int, b: Int)
{
    println("Result: \(addFun(a, b))")
}

func increase(input: Int) -> Int
{
    return input + 1
}
func reduce(input: Int) -> Int
{
    return input - 1
}
func chooseFunction(backwards: Bool) -> (Int) -> Int
{
    return backwards ? reduce : increase
}

extension Double
{
    var cm: Double {return self / 100.0}
    var km: Double {return self * 1000.0}
    var m: Double {return self}
}


func mainFunction(input: Int) -> Int
{
    func internalFunction(input: Int) -> Int
    {
        return input - 1
    }
    return internalFunction(input)
}

func GetList(arr: [Int], pre: (Int) -> Bool) -> [Int]
{
    var tempArr = [Int]()
    for temp in arr
    {
        if pre(temp)
        {
            tempArr.append(temp)
        }
    }
    return tempArr
}

func Function(s: Int, closure: () -> ())
{
    println("s: \(s)")
    if s > 1
    {
        closure()
    }
}

struct School
{
    var name: String
    init()
    {
        name = "学校"
    }
}

struct Distance
{
    var meters: Double = 0.0
    init(fromKm km: Double)
    {
        meters = km * 1000.0
    }
    init(fromCm cm: Double)
    {
        meters = cm / 100.0
    }
}

struct SwiftColor
{
    var red = 0.0, green = 0.0, blue = 0.0
    init(red: Double, green: Double, blue: Double)
    {
        self.red = red
        self.green = green
        self.blue = blue
    }
}

struct ViewPoint
{
    var x = 0.0, y = 0.0
}

extension Int
{
    mutating func square()
    {
        self = self * self
    }
}

extension Int
{
    subscript(index: Int) -> Int
    {
        var decimal = 1
        for i in 0..<index
        {
            decimal *= 10
        }
        return (self / decimal) % 10
    }
}

class EncryptionGenerator: CertificateGenerator
{
    var publicKey = "UUID"
    let privateKey = "400"
    
    func certificate() -> String
    {
        return publicKey + privateKey
    }
}

enum OnOffSwitch: CanBeModified
{
    case Off, On
    mutating func canBeModified()
    {
        switch self
        {
        case .Off: self = On
        case .On: self = Off
        }
    }
}

class ProtocolType
{
    var cer: CertificateGenerator
    init(cerTemp: CertificateGenerator)
    {
        self.cer = cerTemp
    }
    func newCertificate() -> String
    {
        return cer.certificate()
    }
}

class LoadingView: LoadingDelegate
{
    func didLoading()
    {
        println("did loading")
    }
}

class RegistrationView
{
    var delegate: LoadingDelegate?
    func registration()
    {
        let loading = LoadingView()
        delegate = loading
        delegate?.didLoading()
    }
}

@objc class List
{
    var rows = 0
    var dataSource: ListDataSource?
    func increment()
    {
        if let count = dataSource?.numberOfRowInList?(rows)
        {
            rows += count
        }
        else if let count = dataSource?.fixedRrows
        {
            rows += count
        }
    }
}

class Exam
{
    let name: String?
    init(na: String)
    {
        self.name = na
        println("\(self.name) 被初始化")
    }
    deinit
    {
        println("\(self.name) 被反初始化")
    }
}

class Teacher
{
    var tName: String
    var student: Student?
    init(name: String)
    {
        tName = name
        println("老师 \(tName) 实例初始化完成")
    }
    func getName() -> String
    {
        return tName
    }
    deinit
    {
        println("老师 \(tName) 实例反初始化完成")
    }
}
class Student
{
    var sName: String
//    var teacher: Teacher?
    weak var teacher: Teacher?
    init(name: String)
    {
        sName = name
        println("学生 \(sName) 实例初始化完成")
    }
    func getName() -> String
    {
        return sName
    }
    deinit
    {
        println("学生 \(sName) 实例反初始化完成")
    }
}

class JsonElement
{
    let name: String
    let jValue: String?
    lazy var asJson: () -> String =
    {
        [unowned self] in
        if let text = self.jValue
        {
            return "\(self.name): \(text)"
        }
        else
        {
            return "text is nil"
        }
    }
    init(name: String, text: String? = nil)
    {
        self.name = name
        self.jValue = text
        println("初始化闭包")
    }
    deinit
    {
        println("闭包释放")
    }
}

class ViewController: UIViewController {
    
    func downloadImage()
    {
        println("download image")
    }
    
    var thread1: NSThread?
    var thread2: NSThread?
    let conditon1 = NSCondition()
    let conditon2 = NSCondition()
    
    func method1()
    {
        for i in 1..<10
        {
            println("Thread 1 running \(i)")
            sleep(1)
            
            if i == 2
            {
                thread2!.start()
                conditon1.lock()
                conditon1.wait()
                conditon1.unlock()
            }
        }
        println("Thread 1 over")
        conditon2.signal()
    }
    
    func method2()
    {
        for i in 1..<10
        {
            println("Thread 2 running \(i)")
            sleep(1)
            
            if i == 5
            {
                conditon1.signal()
                
                conditon2.lock()
                conditon2.wait()
                conditon2.unlock()
            }
        }
        println("Thread 2 over")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//字符串
        /*
        * \0 空字符串
        * \\ 反斜线
        * \t 水平制表符
        * \n 换行符
        * \r 回车符
        * \" 双引号
        * \' 单引号
        * \u{N} Unicode标量
*/
        println("\u{1F496}")
        
        var string1 = "hello"
        let mark: Character = "!"
        string1.append(mark)
        println((string1))
        
        let counttring = "iphonetrain ????, is ????, the ????, best ????"
        println("counttring has \(count(counttring)) characters")
        println((counttring.lengthOfBytesUsingEncoding(NSUnicodeStringEncoding)))
        
        let quotation = "the url is iphonetrain.com"
        let sameQuotation = "the url is iphonetrain.com"
        println("quotation is equal to sameQuotation: " + (quotation == sameQuotation ? "YES" : "NO"))
        println("quotation has prefix \"the url\": " +  quotation.hasPrefix("the url").description)
        println("quotation has suffix \"the url\": " +  quotation.hasSuffix("the url").description)
        
        let normal = "aBCdefgH wo HEI dH Ik"
        println((normal)  + "\n" + (normal.uppercaseString) + "\n" + (normal.lowercaseString) + "\n" + (normal.capitalizedString))
        
        var emptyString = ""
        println((emptyString.isEmpty))
        
        println((quotation))
        println((quotation as NSString).substringFromIndex(5))
        println((quotation as NSString).substringToIndex(6))
        println((quotation as NSString).substringWithRange(NSMakeRange(4, 5)))
        
        let index = advance(quotation.startIndex, 5)
        let index2 = advance(quotation.endIndex, -6)
        var range = Range<String.Index>(start: index, end: index2)
        println((quotation.substringFromIndex(index)))
        println((quotation.substringToIndex(index2)))
        println((quotation.substringWithRange(range)))
        
//数组
        var arr = [12, "abc"]
        println(arr)
        var someInts = [Int]()
        println((someInts))
        var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
        println((threeDoubles))
        var teachers: [String] = ["Mr. Wang", "Mr. Liu"]
        println((teachers))
        
        println((teachers.count))
        println((teachers.isEmpty))
        teachers.append("Mr. Li")
        println((teachers))
        teachers += ["Mr. Zhang", "Mr. Jiang"]
        println((teachers))
        teachers.insert("Mr. Zhou", atIndex: 0)
        println((teachers))
        teachers.removeAtIndex(1)
        println((teachers))
        teachers.removeLast()
        println((teachers))
        
        teachers[0] = "Mr. Zheng"
        teachers[1...3] = ["Mrs. Liu", "Mrs. Zhao"]
        println((teachers))
        for item in teachers
        {
            println((item))
        }
        for (index, value) in enumerate(teachers)
        {
            println(("Item \(index): \(value)"))
        }
    
//字典
        var airports: Dictionary<String, String>
        var someDictionary: Dictionary<Int, Bool> = [1: true, 2: false]
        println((someDictionary))
        
        enum MapDirection
        {
            case North
            case South
            case East
            case West
        }
        var nameOfDirection: Dictionary<MapDirection, String> = [MapDirection.North: "北", MapDirection.South: "南", MapDirection.East: "东", MapDirection.West: "西"]
        println((nameOfDirection))
        var someEast = MapDirection.East
        println((nameOfDirection[someEast]))
        for (direction, name) in nameOfDirection
        {
            println("\(direction): \(name)")
        }
        var allNames = Array(nameOfDirection.values)
        println((allNames))
        
//类
        var someClass = SomeClass()
        println((someClass))
        println((someClass.value1))
        someClass.value1 = 1
        println((someClass.value1))
        println((someClass.cal))
        println((SomeClass.newValue))
        
        someClass.teachers = 10
        someClass.teachers = 13
        
        var gameRules = GameRules()
        gameRules.additive()
        gameRules.subtraction(10)
        gameRules.reset()
        GameRules.showName()
        
        SomeGame.showName()
        
        var newClass = NewClass()
        newClass.printCount()
        
        var ex = Experience()
        ex[0] = 5
        println((ex[0]))
        
        println("2 + 4 = \(additive(2, 4))")
        
        var newFunc: (Int, Int) -> Int = additive
        println("newFunc: 2 + 3 = \(newFunc(2, 3))")
        newFunc = multiplication
        println("newFunc: 9 * 9 = \(newFunc(9, 9))")
        let anotherFunc = additive
        println("anotherFunc: 8 + 10 = \(anotherFunc(8 , 10))")
        printAdditiveResult(additive, 4, 7)
        
        let aFun = chooseFunction(3 < 2)
        println((aFun(100)))
        
        println((mainFunction(100)))
        
        let numberArr = GetList([1, 2, 3, 4], {(s: Int) in return s > 2})
        println((numberArr))
        
        let numberArr1 = GetList([1, 2, 3, 4], {s in return s > 2})
        let numberArr2 = GetList([1, 2, 3, 4], {s in s > 2})
        let numberArr3 = GetList([1, 2, 3, 4], {$0 > 2})//$0 表示第一个参数
        
        Function(2,
        {
            println("Function: s > 1")
        });
        
        Function(5)
        {
            println("Function: s > 1")
        }
        
        var s = School()
        println("The School name is \(s.name)")
        
        let meters1 = Distance(fromKm: 1.0)
        println((meters1.meters))
        let meters2 = Distance(fromCm: 10)
        println((meters2.meters))
        
        let blue = SwiftColor(red: 0.0, green: 0.0, blue: 1.0)
        println((blue))
        
        let viewPoint = ViewPoint(x: 20.0, y: 100.0)
        
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let lastRefreshDate: AnyObject? = userDefaults.objectForKey("LastRefreshDate")
        if let date = lastRefreshDate as? NSDate
        {
            println("\(date.timeIntervalSinceReferenceDate)")
        }
        
        var base = Base()
        println((base.baseName))
        
        var sub = SubClass()
        println((sub.getBaseName()))
        println((sub.getSubName()))
        
        let m1 = 10.cm
        println("10 cm is \(m1) meters")
        let m2 = 5.0.km
        println("5 km is \(m2) meters")
        
        var someInt = 3
        someInt.square()
        println((someInt))
        
        println("987654321[0] \(987654321[0])")
        
        println((2 as Int).toStringValue())
        
        var arr1 = [[Int](count: 6, repeatedValue: 0), [Int](count: 6, repeatedValue: 0)]
        println("arr1: \(arr1)")
        
        var arr2: (Int, Int) = (2, 5)
        println(arr2)
        
        println((5 as Int).toStringValue() + " is 5")
        
        println("apple".biological)
        let apple = "apple"
        println("\(apple) is a kind of " + apple.printStringrKinds())
//协议
        let generator = EncryptionGenerator()
        println("Certificate Key: \(generator.certificate())")
        
        var lightSwitch = OnOffSwitch.Off
        lightSwitch.canBeModified()
        
        var newProtocolType = ProtocolType(cerTemp: EncryptionGenerator())
        let newCer = newProtocolType.newCertificate()
        println((newCer))
        
        var regView = RegistrationView()
        regView.registration()
        
//ARC
        var exam1: Exam?
        var exam2: Exam?
        var exam3: Exam?
        exam1 = Exam(na: "计算机")
        exam2 = exam1
        exam3 = exam1
        
        exam1 = nil
        exam2 = nil
        exam3 = nil
        
        var teacher: Teacher?
        var student: Student?
        teacher = Teacher(name: "王老师")
        student = Student(name: "李学生")
        teacher!.student = student
        student!.teacher = teacher
        
        teacher = nil
        student = nil
        println("类实例之间的循环强引用－－内存泄漏测试完毕")
        
        var paragraph: JsonElement? = JsonElement(name: "p", text: "hello world")
        println(paragraph!.asJson())
        paragraph = nil
        
//多线程
        self.downloadImage()
        
//        NSThread.detachNewThreadSelector("downloadImage", toTarget: self, withObject: nil)
//        var tempThread: NSThread?
//        tempThread = NSThread(target: self, selector: "downloadImage", object: nil)
//        tempThread!.start()
        
//        thread2 = NSThread(target: self, selector: "method2", object: nil)
//        thread1 = NSThread(target: self, selector: "method1", object: nil)
//        thread1!.start()
        
        var operation: DrinkOperation = DrinkOperation()
        var queue: NSOperationQueue = NSOperationQueue()
        queue.addOperation(operation)
        
        /*
        DISPATCH_QUEUE_SERIAL (串行)
        DISPATCH_QUEUE_CONCURRENT (并行)
        
        DISPATCH_QUEUE_PRIORITY_HIGH (优先级 高)
        DISPATCH_QUEUE_PRIORITY_DEFAULT (优先级 正常)
        DISPATCH_QUEUE_PRIORITY_LOW (优先级 低)
        DISPATCH_QUEUE_PRIORITY_BACKGROUND (优先级 非常低)
*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

