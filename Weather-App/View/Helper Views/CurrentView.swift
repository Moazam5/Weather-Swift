//
//  CurrentView.swift
//  Weather-App
//
//  Created by Moazam Mir on 1/24/21.
//

import SwiftUI

struct CurrentView: View {
    
    let city : String
    let currentData : CurrentWeatherModel
    
    var body: some View {
      
        
        VStack{
            HStack{
                Image(systemName: currentData.iconName)
                VStack(alignment: .leading) {
                    Text("Today")
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                    Text(currentData.currentDate)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
            }
            Text("\(currentData.temperature)")
                .font(.system(size: 75))
                .fontWeight(.thin)
                .foregroundColor(.yellow)
            Text(city)
                .font(.system(size: 16))
                .fontWeight(.medium)
            Spacer()
            

                
        }
        .frame(maxWidth : .infinity , maxHeight: 200)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .init(.sRGB, white: 0, opacity: 0.20), radius: 4, x: 0, y: 4)
            
            
    
            
     
    
    }
    
}


struct CurrentView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentView( city: "New York, N", currentData: WeatherService.shared.currentTemperatureData)
    }
}

