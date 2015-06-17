//
//  ViewController.swift
//  SwiftClassP2C7
//
//  Created by apple on 15/6/17.
//  Copyright (c) 2015年 cipnet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    var imageView: UIImageView?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var btn = UIButton.buttonWithType(.Custom) as! UIButton
        btn.frame = CGRectMake(20, 20, self.view.frame.size.width - 40, 40)
        btn.setTitle("Btn", forState: .Normal)
        btn.backgroundColor = UIColor.grayColor()
        self.view.addSubview(btn)
        btn.addTarget(self, action: "btnClicked:", forControlEvents: .TouchUpInside)
        
        imageView = UIImageView(frame: CGRectMake(20, 100, self.view.frame.size.width - 40, 200))
        imageView?.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(imageView!)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fromAlbum()
    {
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary)
        {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .PhotoLibrary
            self.presentViewController(picker, animated: true, completion:
            {
            })
        }
    }
    
    func btnClicked(sender: UIButton)
    {
        self.fromAlbum()
    }


    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject])
    {
        println((info))
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView!.image = image
        picker.dismissViewControllerAnimated(true, completion:
        {
                
        })
    }
}

