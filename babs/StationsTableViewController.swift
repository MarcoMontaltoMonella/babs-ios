//
//  StationsTableViewController.swift
//  babs
//
//  Created by Marco Montalto Monella on 18/07/2015.
//  Copyright (c) 2015 Marco Montalto Monella. All rights reserved.
//

import UIKit

//adding class, we are saying that this protocol could only be implemented by classes (and so we can use weak on stations).
protocol StationTableViewDataSource: class {
    func stationsForTableView(sender: StationsTableViewController) -> [Station]
}

class StationsTableViewController: UITableViewController {
    
    //1. var stations = empty bike stations 🚲 stations[stationsObj]
    //using weak the controller could go out of memory once its job is done! Often used in delegation
    
    weak var stations: StationTableViewDataSource?
    

    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //2. request station lists
        //2.5 dispatch_async(dispatch_get_main_queue())
        //3. add to the list and tableView.reloadData()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    // MARK: - UITableViewDataSource

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.

        // How many landmarks????
        // return landmarks.count or stations.computedProperty
        return 1
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        //return stations[section].count
        return 10
    }
    
    private struct Storyboard {
        static let CellReuseIdentifier = "Station"
    }
    
    var i = 0 {
        willSet{
            println("The new value is \(newValue)")
        }
        didSet{
            println("The old value was \(oldValue)")
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellReuseIdentifier, forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        
        cell.textLabel?.text = "Number \(i++)"
        /*
        let stations: [Station] = stations?.stationsForTableView(self)
        let station = stations[indexPath.section]
        cell.textLabel!.text = station.name
        cell.detailTextLabel!.text = "\(station.dockcount)"
        */
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
