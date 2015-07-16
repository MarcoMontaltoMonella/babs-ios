//
//  ViewController.swift
//  babs
//
//  Created by Marco Montalto Monella on 16/07/2015.
//  Copyright (c) 2015 Marco Montalto Monella. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //return how many rows in my table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    //return how many sections in my table
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //contents of each cell. Called for every cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text = "Orange!"
        return cell
    }

}

