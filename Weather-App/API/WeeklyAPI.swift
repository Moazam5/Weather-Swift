//
//  WeeklyAPI.swift
//  Weather-App
//
//  Created by Moazam Mir on 1/25/21.
//

import Foundation

struct WeeklyAPI  : Codable{
    var list : [Day]
    
  
}

struct Day : Codable {
    let dt : Int
    let main : Main
    let weather : [Weather]
    
}

struct Main  : Codable{
    private let temp : Double
    var formattedTemp : String{
        "\(Int(temp))º"
    }
    
    let temp_max : Double
    let temp_min : Double
    
}

struct WeeklyWeather  : Codable{
    let id : Int
    let main : String
    let description : String
    let icon : String
}
