//
//  WeeklyModel.swift
//  Weather-App
//
//  Created by Moazam Mir on 1/23/21.
//

import Foundation
struct WeeklyModel : Codable {
    
    var list : [WeatherList]
    var city : City
    
}

struct WeatherList : Codable {
    var main : WeeklyMain
    var weather : WeeklyWeather
}
struct WeeklyMain : Codable
{
    var temp : Double
    var feels_like : Double
}
//Dont really need this
struct WeeklyWeather : Codable{
    var id : Int
    var main : String
    
}


struct City : Codable{
    var id : Int
    var name : String
}
