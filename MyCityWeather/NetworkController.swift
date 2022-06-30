//
//  NetworkController.swift
//  MyCityWeather
//
//  Created by Sergey Pavlov on 29.06.2022.
//

import Foundation

struct NerworlControlller {
  
    private static var baseUrl = "https://api.openweathermap.org/data/2.5/weather"
    
    enum Endpoint {
        case cityId(Int)
        
        var queryParameters: [URLQueryItem] {
            
            var queryParameters = [URLQueryItem]()
            
            switch self {
            case.cityId(let id):
                return [URLQueryItem(name: "id", value: String(id))]
            }
        }
    }
    
    // static func fetchMailMessages(_ completion: @escaping (([Mail.Message]) -> Void))
    
}
