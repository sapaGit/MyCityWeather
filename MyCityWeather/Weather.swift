//
//  Weather.swift
//  MyCityWeather
//
//  Created by Sergey Pavlov on 29.06.2022.
//

import Foundation
struct Weather: Decodable {
    var main: [Main]
    
    struct Main: Decodable {
        var temp: Double
        var feelsLike: Double
        var tempMin: Double
        var tempMax: Double
        var pressure: Double
        var humidity: Double
        
        enum CodingKeys: String, CodingKey {
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case temp, pressure, humidity
        }
        
    }
}
