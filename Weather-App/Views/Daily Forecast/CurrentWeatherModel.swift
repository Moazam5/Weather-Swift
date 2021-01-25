//
//  CurrentWeatherModel.swift
//  Weather-App
//
//  Created by Moazam Mir on 1/24/21.
//

import Foundation

struct CurrentWeatherModel {
    var temperature : String
    var city : String
    var currentDate : String
    var iconName : String
    var hourly : [Current]
    var id : Int
    
    var conditionName: String {
        switch id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
   
}
