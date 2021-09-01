//
//  ViewController.swift
//  Intro Map Kit
//
//  Created by Sidnei de Souza Junior on 09/09/17.
//  Copyright © 2017 Sidnei de Souza Junior. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var userManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        userManager.delegate = self
        userManager.desiredAccuracy = kCLLocationAccuracyBest
        userManager.requestWhenInUseAuthorization()
        userManager.startUpdatingLocation()
        mapView.setRegion(MKCoordinateRegion(center: (userManager.location?.coordinate)!, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)
        mapView.showsUserLocation = true
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let local = locations.first {
            let latitude = local.coordinate.latitude
            let longitude = local.coordinate.longitude
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            createLine(location: coordinate)
        }
        
    }
    
    func createLine(location: CLLocationCoordinate2D) {
        let latitude = location.latitude
        let longitude = location.longitude
        var coord = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let line = MKPolyline(coordinates: &coord, count: 2)
        mapView.add(line)
    }

    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let line = MKPolylineRenderer(overlay: overlay)
            line.strokeColor = UIColor.black
            line.lineWidth = 1
            return line
        } else {
            return MKOverlayRenderer()
        }
    }
    
}

