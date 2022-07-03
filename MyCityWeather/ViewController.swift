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
    
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var conditionLabel: UILabel!
    
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
    func updateView() {
        
    }
    
    func updateWeatherInfo(latitude: Double, longitude: Double) {
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&units=metric&appid=9dc585ecc48e43d2d2420f0b3d434e7d")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("DataTask error: \(error!.localizedDescription)")
                return
            }
            do {
                self.weatherData = try JSONDecoder().decode(WeatherData.self, from: data!)
                DispatchQueue.main.async {
                    self.updateView()
                }
                print(self.weatherData)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            updateWeatherInfo(latitude: lastLocation.coordinate.latitude, longitude: lastLocation.coordinate.longitude)
            print(lastLocation.coordinate.latitude, lastLocation.coordinate.longitude)
        }
    }
}
