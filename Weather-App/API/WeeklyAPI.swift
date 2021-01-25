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
    
    private  let dt : Int
    let main : Main
    let weather : [WeeklyWeather]
    
    var formattedDate : String {
       let date = Date(timeIntervalSince1970: TimeInterval(dt))

        let df = DateFormatter()
        df.dateFormat = "h:00 a"
        return df.string(from: date)
    }
    
}

struct Main  : Codable{
    private let temp : Double
    var temperature : String{
        "\(Int(temp))º"
    }
    
    private let temp_max : Double
    private let temp_min : Double
    
    var maxTemp : String{
        "\(Int(temp_max))º"
    }
    
    var minTemp : String{
        "\(Int(temp_min))º"
    }
    
    
}

struct WeeklyWeather  : Codable{
    let id : Int
    let main : String
    let description : String
    let icon : String
}
