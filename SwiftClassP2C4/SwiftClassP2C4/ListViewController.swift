//
//  ListViewController.swift
//  SwiftClassP2C4
//
//  Created by apple on 15/6/15.
//  Copyright (c) 2015年 lh. All rights reserved.
//

import UIKit

class ListViewController: UIViewController , UITableViewDataSource, UITableViewDelegate
{
    var items: [String] = ["1", "2"]
    let cellIdentifier: String = "cellIdentifier"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        var listTabelView: UITableView = UITableView(frame: CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20), style: UITableViewStyle.Grouped)
        listTabelView.delegate = self
        listTabelView.dataSource = self
        self.view.addSubview(listTabelView)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        if cell == nil
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
            cell!.textLabel!.font = UIFont.systemFontOfSize(14)
            cell!.selectionStyle = .Gray
            cell!.accessoryType = .DisclosureIndicator
        }
        cell?.textLabel?.text = items[indexPath.row]
        return cell!
    }
}
