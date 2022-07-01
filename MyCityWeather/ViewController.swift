//
//  ViewController.swift
//  MyCityWeather
//
//  Created by Sergey Pavlov on 28.06.2022.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLocationManager()
    
    }
    func startLocationManager() {
       //creating request
        locationManager.requestWhenInUseAuthorization()
        
        //Checking user permission
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            
                //accuracy of coordinates
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.pausesLocationUpdatesAutomatically = false
            locationManager.startUpdatingLocation()
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            print(lastLocation.coordinate.latitude, lastLocation.coordinate.longitude)
        }
    }
}
