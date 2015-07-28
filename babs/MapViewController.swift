//
//  MapViewController.swift
//  babs
//
//  Created by Marco Montalto Monella on 17/07/2015.
//  Copyright (c) 2015 Marco Montalto Monella. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var pinLocation: CLLocationCoordinate2D!
    var pinTitle: String!
    var pinSubtitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.mapType = .Standard
        mapView.frame = view.frame
        mapView.delegate = self
        view.addSubview(mapView)
        
//        println("MapViewController loaded!")
    }
    
    /* Without storyboard init */
//    required init(coder aDecorer: NSCoder){
//        super.init(coder: aDecorer)
//        mapView = MKMapView()
//    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        addPinToMapView()
    }
    
    func pinPoint(#longitude: Double, latitude: Double, title: String, subtitle: String) {
        pinLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        pinTitle = title
        pinSubtitle = subtitle
    }
    
    /* We have a pin on the map; now zoom into it and make that pin the center of the map */
    func setCenterOfMapToLocation(location: CLLocationCoordinate2D){
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func addPinToMapView(){
        /* Create the annotation using the location */
        let annotation = PinAnnotation(coordinate: pinLocation, title: pinTitle, subtitle: pinSubtitle)
        mapView.addAnnotation(annotation)
        setCenterOfMapToLocation(pinLocation)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


