//
//  ViewController.swift
//  SwiftClassP2C12
//
//  Created by apple on 15/7/3.
//  Copyright (c) 2015年 lh. All rights reserved.
//

import UIKit
import AddressBook
import AddressBookUI
import MessageUI

class ViewController: UIViewController, UINavigationControllerDelegate, MFMessageComposeViewControllerDelegate {

    var sysContacts: NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var btn = UIButton(frame: CGRectMake(40, 40, self.view.frame.size.width - 80, 40))
        btn.setTitle("Button", forState: .Normal)
        btn.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(btn)
        btn.addTarget(self, action: "btnClicked:", forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func btnClicked(btn: UIButton)
    {
        if MFMessageComposeViewController.canSendText()
        {
            let controller = MFMessageComposeViewController()
            controller.body = "内容"
            controller.recipients = ["1234567"]
            controller.messageComposeDelegate = self
            self.presentViewController(controller, animated: true, completion: nil)
        }
        else
        {
            println("can not send message")
        }
    }
    
    func authorize()
    {
        var error: Unmanaged<CFErrorRef>?
        var addressBook: ABAddressBookRef? = ABAddressBookCreateWithOptions(nil, &error).takeRetainedValue()
        let sysAddressBookStatus = ABAddressBookGetAuthorizationStatus()
        if sysAddressBookStatus != .Denied && sysAddressBookStatus != .NotDetermined
        {
            var authorizedSingal: dispatch_semaphore_t = dispatch_semaphore_create(0)
            var askAuthorization: ABAddressBookRequestAccessCompletionHandler =
            {
                success, error in
                if success
                {
                    self.sysContacts = ABAddressBookCopyArrayOfAllPeople(addressBook).takeRetainedValue() as NSArray
                    println((self.sysContacts))
                    dispatch_semaphore_signal(authorizedSingal)
                }
            }
            ABAddressBookRequestAccessWithCompletion(addressBook, askAuthorization)
            dispatch_semaphore_wait(authorizedSingal, DISPATCH_TIME_FOREVER)
        }
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
        switch result.value
        {
        case MessageComposeResultSent.value:
            println("send success")
        case MessageComposeResultCancelled.value:
            println("canceled")
        case MessageComposeResultFailed.value:
            println("failed")
        default:
            break
        }
    }
}

