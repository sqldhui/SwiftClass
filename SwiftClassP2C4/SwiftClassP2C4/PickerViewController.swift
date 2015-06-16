//
//  PickerViewController.swift
//  SwiftClassP2C4
//
//  Created by apple on 15/6/16.
//  Copyright (c) 2015年 lh. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    let name = ["li", "zheng", "wang"]
    let action = ["work", "run", "sleep"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.grayColor()
        
        var datePicker: UIDatePicker = UIDatePicker(frame: CGRectMake(0, 20, 0, 0))
        println((datePicker.frame.size.height))
        self.view.addSubview(datePicker)
        datePicker.datePickerMode = .CountDownTimer
        datePicker.minuteInterval = 5
        
        var picker: UIPickerView = UIPickerView(frame: CGRectMake(0, 260, 0, 0))
        picker.dataSource = self
        picker.delegate = self
        self.view.addSubview(picker)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 2
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return (component == 0 ? name.count : action.count)
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!
    {
        return (component == 0 ? name[row] : action[row])
    }
}
