//
//  WeeklyAPI.swift
//  Weather-App
//
//  Created by Moazam Mir on 1/25/21.
//

import Foundation

struct WeeklyDataModel  : Codable{
    var list : [Day]
    
  
}

struct Day : Codable {
    
    private  let dt : Int
    let main : Main
    let weather : [WeeklyWeather]
    
    var formattedTime : String {
       let date = Date(timeIntervalSince1970: TimeInterval(dt))

        let df = DateFormatter()
        df.dateFormat = "h:00 a"
        return df.string(from: date)
    }
    
    var formattedDate : String {
       let date = Date(timeIntervalSince1970: TimeInterval(dt))

        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d"
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
    private let id : Int
    let main : String
    let description : String
    let icon : String
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
