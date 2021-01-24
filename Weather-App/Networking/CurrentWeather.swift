//
//  CurrentWeather.swift
//  Weather-App
//
//  Created by Moazam Mir on 1/23/21.
//

import Foundation

struct CurrentWeather  : Codable{
    var name : String
    var main : Main
    var weather : [Weathers]
    
}

struct Main : Codable{
    var temp : Double
    var pressure : Int
    var feels_like : Double
}

struct Weathers : Codable {
    var id : Int
    var description : String
    var icon : String
    var main : String
    
}
