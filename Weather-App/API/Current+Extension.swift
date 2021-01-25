//
//  Current+Extension.swift
//  Weather-App
//
//  Created by Moazam Mir on 1/24/21.
//

import Foundation
extension Current {

    var formattedHour : String{
        let date = Date(timeIntervalSince1970: TimeInterval(dt))

         let df = DateFormatter()
         df.dateFormat = "h: mm a"
         return df.string(from: date)
     }
    var formattedDate : String {
       let date = Date(timeIntervalSince1970: TimeInterval(dt))

        let df = DateFormatter()
        df.dateFormat = "E, d MMM"
        return df.string(from: date)
    }
    
    var formattedTemp : String{
        "\(Int(temp))º"
    }
    
    var iconName : String{
        let iconName = weather.first?.icon ?? "cloud"
        return WeatherService.shared.icons[iconName]?.icon ?? "cloud"
        
    }
    
  
}
