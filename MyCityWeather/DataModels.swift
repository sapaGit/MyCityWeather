//
//  DataModels.swift
//  MyCityWeather
//
//  Created by Sergey Pavlov on 02.07.2022.
//

import Foundation

struct WeatherData: Codable {
    var weather: [Weather] = []
    var main: Main = Main()
    var name: String = ""
}


// MARK: - Main
struct Main: Codable {
    var temp: Double = 0.0
    var pressure: Int = 0
    var humidity: Int = 0
}


// MARK: - Weather
struct Weather: Codable {
    var id: Int
    var main, weatherDescription, icon: String
}

