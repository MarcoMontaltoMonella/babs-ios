//
//  PinAnnotation.swift
//  babs
//
//  Created by Marco Montalto Monella on 26/07/2015.
//  Copyright (c) 2015 Marco Montalto Monella. All rights reserved.
//

import UIKit
import MapKit

class PinAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(0,0)
    var title: String!
    var subtitle: String!
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String){
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        super.init()
    }
    
}
