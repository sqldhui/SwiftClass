//
//  ViewController.swift
//  SwiftClassP2C9
//
//  Created by apple on 15/6/29.
//  Copyright (c) 2015年 lh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLConnectionDataDelegate {

    var jsonData: NSMutableData = NSMutableData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var label = UILabel(frame: CGRectMake(20, 20, self.view.frame.size.width - 40, 30))
        self.view.addSubview(label)
        
        var label2 = UILabel(frame: CGRectMake(20, 60, self.view.frame.size.width - 40, 30))
        self.view.addSubview(label2)
        
        if Reachability.isConnectedToNetwork()
        {
            label.text = "Y"
        }
        else
        {
            label.text = "N"
        }
        
        let type = Reachability.isConnectedToNetworkOfType()
        switch type
        {
        case .WWAN:
            label2.text = "WWAN"
        case .WiFi:
            label2.text = "WiFi"
        case .NotConnected:
            label2.text = "N"
        }
        self.sessionSimpleDownload()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func httpSynchronousRequest()
    {
        var url: NSURL! = NSURL(string: "http://www.weather.com.cn/data/cityinfo/101010100.html")
        var urlRequest: NSURLRequest = NSURLRequest(URL: url)
        var response: NSURLResponse?
        var error: NSError?
        var data: NSData? = NSURLConnection.sendSynchronousRequest(urlRequest, returningResponse: &response, error: &error)
        if (error != nil)
        {
            println((error?.code))
            println((error?.description))
        }
        else
        {
            println((response))
            var jsonString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            println((jsonString))
        }
    }
    func httpAsynchronousRequest()
    {
        var url: NSURL! = NSURL(string: "http://www.weather.com.cn/data/cityinfo/101010100.html")
        var urlRequest: NSURLRequest = NSURLRequest(URL: url)
        var conn: NSURLConnection? = NSURLConnection(request: urlRequest, delegate: self)
        conn?.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
        conn?.start()
    }
    
    func connection(connection: NSURLConnection, willSendRequest request: NSURLRequest, redirectResponse response: NSURLResponse?) -> NSURLRequest?
    {
        return request;
    }
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse)
    {
        
    }
    func connection(connection: NSURLConnection, didReceiveData data: NSData)
    {
        self.jsonData.appendData(data)
    }
    func connection(connection: NSURLConnection, needNewBodyStream request: NSURLRequest) -> NSInputStream?
    {
        return request.HTTPBodyStream;
    }
    func connection(connection: NSURLConnection, didSendBodyData bytesWritten: Int, totalBytesWritten: Int, totalBytesExpectedToWrite: Int)
    {
        
    }
    func connection(connection: NSURLConnection, willCacheResponse cachedResponse: NSCachedURLResponse) -> NSCachedURLResponse?
    {
        return cachedResponse;
    }
    func connectionDidFinishLoading(connection: NSURLConnection)
    {
        var jsonString = NSString(data: self.jsonData, encoding: NSUTF8StringEncoding)
        println((jsonString))
    }
    
    func synchronousGet()
    {
        var url: NSURL! = NSURL(string: "http://www.weather.com.cn/data/cityinfo/101010100.html")
        var urlRequest: NSURLRequest = NSURLRequest(URL: url, cachePolicy: NSURLRequestCachePolicy.UseProtocolCachePolicy, timeoutInterval: 10)
        var response: NSURLResponse?
        var error: NSError?
        var data: NSData? = NSURLConnection.sendSynchronousRequest(urlRequest, returningResponse: &response, error: &error)
        if (error != nil)
        {
            println((error?.code))
            println((error?.description))
        }
        else
        {
            println((response))
            var jsonString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            println((jsonString))
        }
    }
    
    func sessionLoadData()
    {
        var url: NSURL! = NSURL(string: "http://www.weather.com.cn/data/cityinfo/101010100.html")
        var request: NSURLRequest = NSURLRequest(URL: url)
        var session = NSURLSession.sharedSession()
        var dataTask = session.dataTaskWithRequest(request, completionHandler:
        {
            (var data: NSData?, var response: NSURLResponse?, var error: NSError?) -> Void in
            if (error != nil)
            {
                println((error?.code))
                println((error?.description))
            }
            else
            {
                println((response))
                var jsonString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                println((jsonString))
            }
        }) as NSURLSessionTask
        dataTask.resume()
    }
    
    func sessionSimpleDownload()
    {
        var url: NSURL! = NSURL(string: "http://www.iphonetrain.com/shop/data/ios/201404/source/2809080296130100.jpg")
        var request: NSURLRequest = NSURLRequest(URL: url)
        var session = NSURLSession.sharedSession()
        var downloadTask = session.downloadTaskWithRequest(request, completionHandler:
        {
            (var location: NSURL?, var response: NSURLResponse?, var error: NSError?) -> Void in
            println("location: \(location)")
            var locationPath = location?.path
            let documents: String = NSHomeDirectory() + "/Documents/1.png"
            var fileManager: NSFileManager = NSFileManager.defaultManager()
            fileManager.moveItemAtPath(locationPath!, toPath: documents, error: nil)
            println("location: \(documents)")
        })
        downloadTask.resume()
    }
}

