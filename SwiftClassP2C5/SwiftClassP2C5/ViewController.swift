//
//  ViewController.swift
//  SwiftClassP2C5
//
//  Created by apple on 15/6/16.
//  Copyright (c) 2015年 cipnet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.grayColor()
        
        var userDefault: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        println((userDefault.dictionaryRepresentation()))
        
        var customUserDefault: NSUserDefaults = NSUserDefaults(suiteName: "SwiftClass")!
        println((customUserDefault.dictionaryRepresentation()))
        
        //HomeDirectory
        let home = NSHomeDirectory()
        println((home))
        //Home/Documents
        let documentPaths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documents1 = documentPaths[0] as! String
        println((documents1))
        let documents2 = home + "/Documents"
        println((documents2))
        ///Home/Library
        let libraryPaths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.LibraryDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let library1 = libraryPaths[0] as! String
        println((library1))
        let library2 = home + "/Library"
        println((library2))
        //Home/Library/Caches
        let cachesPaths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let caches1 = cachesPaths[0] as! String
        println((caches1))
        var caches2 = home + "/Library/Caches"
        println((caches2))
        //Home/tmp
        let tmp1 = NSTemporaryDirectory()
        println((tmp1))
        let tmp2 = home + "/tmp"
        println((tmp2))
        
        let fileManager: NSFileManager = NSFileManager.defaultManager()
        var error: NSError?
        let myPath1 = home + "/Documents/myFolder/Images"
        var isSuccess: Bool = fileManager.createDirectoryAtPath(myPath1, withIntermediateDirectories: true, attributes: nil, error: &error)
        if error != nil
        {
            println((error))
        }
        
        var filePath1 = myPath1 + "/appInfo.txt"
        var info = "test some write"
        info.writeToFile(filePath1, atomically: true, encoding: NSUTF8StringEncoding, error: &error)
        
        var filePath2 = myPath1 + "/array.plist"
        var arr = ["1", "2"] as NSArray
        arr.writeToFile(filePath2, atomically: true)
        
        var files = fileManager.subpathsAtPath(myPath1)
        println((files))
        
        var fileAttributes: [NSObject: AnyObject]? = fileManager.attributesOfItemAtPath(filePath1, error: &error)
        println((fileAttributes))
        var modificationdate: AnyObject? = fileAttributes![NSFileModificationDate]
        println((modificationdate))
        var fileSize: AnyObject? = fileAttributes![NSFileSize]
        println((fileSize))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

