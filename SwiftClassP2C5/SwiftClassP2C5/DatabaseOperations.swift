//
//  DatabaseOperations.swift
//  SwiftClassP2C5
//
//  Created by apple on 15/6/17.
//  Copyright (c) 2015年 cipnet. All rights reserved.
//

import UIKit

class DatabaseOperations: NSObject {
    private var db: COpaquePointer = nil
    required init(dbPath: String)
    {
        println("db path: " + dbPath)
        let cpath = dbPath.cStringUsingEncoding(NSUTF8StringEncoding)
        let error = sqlite3_open(cpath!, &db)
        if error != SQLITE_OK
        {
            sqlite3_close(db)
        }
    }
}
