//
//  StationsTableViewController.swift
//  babs
//
//  Created by Marco Montalto Monella on 18/07/2015.
//  Copyright (c) 2015 Marco Montalto Monella. All rights reserved.
//

import UIKit

//adding class, we are saying that this protocol could only be implemented by classes (and so we can use weak on stations).
/*
protocol StationTableViewDataSource: class {
    func stationsForTableView(sender: StationsTableViewController) -> [Station]
}
*/

class StationsTableViewController: UITableViewController {
    
    //1. var stations = empty bike stations 🚲 stations[stationsObj]
    //using weak the controller could go out of memory once its job is done! Often used in delegation
    
    //weak var stations: StationTableViewDataSource?
    
    // TEMPORARY DATA ARRAY
    var stations: [Station] = []

    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        //***************** TEMPORARY DATA START *********************
        
        let st1 = Station(id: 2, name: "San Jose Diridon Caltrain Station", latitude: 37.329732, longitude: -121.901782, dockcount: 27, landmark: "San Jose", installation: "2013-08-06")
        let st2 = Station(id: 3, name: "San Jose", latitude: 37.330698, longitude: -121.888979, dockcount: 15, landmark: "San Jose", installation: "2013-08-05")
        let st3 = Station(id: 4, name: "Santa Clara at Almaden", latitude: 37.333988, longitude: -121.894902, dockcount: 11, landmark: "San Jose", installation: "2013-08-06")
        let st4 = Station(id: 5, name: "Adobe on Almaden", latitude: 37.331415, longitude: -121.8932, dockcount: 19, landmark: "San Jose", installation: "2013-08-05")
        
        //equivalent
        //tmpStationsArray.append(st1)
        
        //tmpStationsArray += [st1,st2,st3,st4]
        
        //***************** TEMPORARY DATA END *********************
        
        stations = []
        
        let b = BabsDAO()
        
        stations = b.stationsForTableView()
        
        
        
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
        return stations.count
    }
    
    
    private struct Storyboard {
        static let CellReuseIdentifier = "StationCell"
        static let GeneralCell = "generalCellSegue"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellReuseIdentifier, forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        
        cell.textLabel!.text = stations[indexPath.row].description
        cell.detailTextLabel!.text = String("\(stations[indexPath.row].id!)")
        /*
        let stations: [Station] = stations?.stationsForTableView(self)
        let station = stations[indexPath.section]
        cell.textLabel!.text = station.name
        cell.detailTextLabel!.text = "\(station.dockcount)"
        */
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        println("Inside peformSegue")
        performSegueWithIdentifier(Storyboard.GeneralCell, sender: UITableViewCell.self)
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        println("Inside prepareForSegue")
        if let mapvc = segue.destinationViewController as? MapViewController {
            if segue.identifier == Storyboard.GeneralCell {
                if let selectedID = tableView.indexPathForSelectedRow()?.row { //FIXME doesn't get in!
                    //get ID coordinates
                    let selectedStation = stations[selectedID]
                    mapvc.title = selectedStation.name!
                    mapvc.pinPoint(longitude: selectedStation.longitude!, latitude: selectedStation.latitude!, title: selectedStation.name!, subtitle: "\(selectedStation.dockcount!) 🚴")
                }
            }
        }
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
