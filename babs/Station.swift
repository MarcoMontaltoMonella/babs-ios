//
//  Station.swift
//  babs
//
//  Created by Marco Montalto Monella on 19/07/2015.
//  Copyright (c) 2015 Marco Montalto Monella. All rights reserved.
//

import Foundation

class Station {
    
    var id: Int?
    var name: String?
    var latitude,longitude: Double?
    var dockcount: Int?
    var landmark: String?
    var installation: String? //change it to NSDate later on...
    
    init(id: Int, name: String, latitude: Double, longitude: Double, dockcount: Int, landmark: String, installation: String){
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.dockcount = dockcount
        self.landmark = landmark
        self.installation = installation
    }
    
    
}