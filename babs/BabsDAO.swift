//
//  BabsDAO.swift
//  babs
//
//  Created by Marco Montalto Monella on 19/07/2015.
//  Copyright (c) 2015 Marco Montalto Monella. All rights reserved.
//

import Foundation


class BabsDAO{
    
    var stations: [Station] = [Station]()
    
    //get the data from the json and return a [Station] array
    func stationsForTableView() -> [Station] {
        get_data_from_url("http://localhost/iOS/service.php")
        return stations
    }
    
    func getAllLandmarks() -> [String]{
        var result: [String] = [String]()
        
        return result
    }
    
    func getAllTrips(){
        
    }
    
    func get_data_from_url(url:String){
        let httpMethod = "GET"
        let timeout = 15
        let url = NSURL(string: url)
        let urlRequest = NSMutableURLRequest(URL: url!, cachePolicy: .ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 15.0)
        let queue = NSOperationQueue()
        var data = NSData(contentsOfURL: url!)
        extract_json(data!)
    }
    
    func extract_json(data:NSData)
    {
        var parseError: NSError?
        let jsonData:NSData = data
        let json: AnyObject? = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &parseError)
        if (parseError == nil){
            if let stations_list = json as? NSArray {
                for (var i = 0; i < stations_list.count ; i++ ) {
                    if let station = stations_list[i] as? NSDictionary {
                       if let id = station["station_id"] as? String {
                           if let name = station["name"] as? String {
                                if let latitude = station["lat"] as? String{
                                    if let longitude = station["long"] as? String {
                                        if let dockcount = station["dockcount"] as? String {
                                            if let landmark = station["landmark"] as? String{
                                                if let installation = station["installation"] as? String{
                                                    let stationObj = Station(id: id.toInt()!, name: name, latitude: (latitude as NSString).doubleValue, longitude: (longitude as NSString).doubleValue, dockcount: dockcount.toInt()!, landmark: landmark, installation: installation)
                                                    stations += [stationObj]
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
   
    
    
}