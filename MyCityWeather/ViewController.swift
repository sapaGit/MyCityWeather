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
    var weatherData = WeatherData()
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
    
    
    func updateWeatherInfo(latitude: Double, longitude: Double) {
        let session = URLSession.shared
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude.description)&lon=\(longitude.description)&units=metric&appid=9dc585ecc48e43d2d2420f0b3d434e7d")!
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("DataTask error: \(error?.localizedDescription)")
                return
            }
            do {
                
            } catch {
                print(error.localizedDescription)
            }
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
