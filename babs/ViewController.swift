//
//  ViewController.swift
//  babs
//
//  Created by Marco Montalto Monella on 16/07/2015.
//  Copyright (c) 2015 Marco Montalto Monella. All rights reserved.
//

import UIKit

//TESTING ViewController NOT USED!

class ViewController: UIViewController, UITableViewDataSource {

    //Testing struct
    struct FixedLengthRange: Printable {
        var firstValue: Int
        let length: Int
        var description: String {
            var result = ""
            for i in Range(start: firstValue,end: (firstValue+length)){
                result += String(i) + ","
            }
            result += String(firstValue+length) + "."
            return result
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        var rangeToBePrinted = FixedLengthRange(firstValue: 5, length: 6)
//        println("First \(rangeToBePrinted)")
//        rangeToBePrinted.firstValue = 1
//        println("Second \(rangeToBePrinted)")
        
    }

    //return how many rows in my table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //return how many sections in my table. Default: 1 
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    //contents of each cell. Called for every cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let data = "Orange"
        let dequeued: AnyObject = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        let cell = dequeued as! UITableViewCell
        cell.textLabel?.text = data
        cell.detailTextLabel?.text = "Subtitle"
        
        return cell
    }


}

