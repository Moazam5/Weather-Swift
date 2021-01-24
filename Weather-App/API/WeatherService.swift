//
//  weatherService.swift
//  Weather-App
//
//  Created by Moazam Mir on 1/24/21.
//

import Foundation

final class WeatherService{
    static let shared = WeatherService()
    
    var json : API {
        let decoder = JSONDecoder()
        
        let url = Bundle.main.url(forResource: "weatherResponse", withExtension: "json")!
         let data = try! Data(contentsOf: url)
        return try! decoder.decode(API.self, from: data)
        
        
    }
    
}
