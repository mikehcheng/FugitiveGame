//
//  MapViewController.swift
//  FugitiveGame
//
//  Created by Michael Cheng on 10/10/15.
//  Copyright (c) 2015 Michael Cheng. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var mapView: MKMapView!
    var locationManager: CLLocationManager!
    let screenSize: CGRect = UIScreen.mainScreen().bounds

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager();
            locationManager.delegate = self;
            locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            locationManager.requestWhenInUseAuthorization()
        }
        
        
        mapView = MKMapView(frame: CGRectMake(0, 0, screenSize.width, screenSize.height/2))
        mapView.delegate = self
        mapView.scrollEnabled = true
        mapView.zoomEnabled = true
        mapView.tintColor = UIColor.purpleColor()
        
        //Pin Annotations
        let startPin = MKPointAnnotation()
        startPin.title = "Start"
        startPin.coordinate = CLLocationCoordinate2DMake(37.869, -122.263)
        let endPin = MKPointAnnotation()
        endPin.title = "End"
        endPin.coordinate = CLLocationCoordinate2DMake(37.874, -122.256)
        
        mapView.addAnnotation(startPin)
        mapView.addAnnotation(endPin)
        
        self.view.addSubview(mapView)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last as CLLocation!
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
        }
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if (annotation is MKUserLocation) {
            //if annotation is not an MKPointAnnotation (eg. MKUserLocation),
            //return nil so map draws default view for it (eg. blue dot)...
            return nil
        }
        
        let anView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        if (annotation.title! == "Start") {
            if #available(iOS 9.0, *) {
                anView.pinTintColor = UIColor.blueColor()
            } else {
                anView.pinColor = MKPinAnnotationColor.Green
            }
        }
        return anView
        
    }
    
    // Custom annotation for robber and cop (+nickname), start / end use regular pins?
    // Should start monitoring end region to mark as finished, also possibly the area around for cops, might not be client decision
}

