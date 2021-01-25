//
//  HourlyForecastView.swift
//  Weather-App
//
//  Created by Moazam Mir on 1/24/21.
//

import SwiftUI

struct HourlyForecastView: View {
    let hourlyForecast : [Current]
    var body: some View {
        ScrollView(.horizontal){ 
            HStack
            {
                ForEach(Array(hourlyForecast.enumerated()), id:\.offset){ offset,forecast in
                
                VStack(spacing : 25) {
                    Text(offset == 0 ? "Now" : forecast.formattedHour)
                        .fontWeight(.heavy)
                        .font(.system(size: 20))
                    
                    Image(systemName: forecast.iconName)
                    Text(forecast.formattedTemp)
                        .fontWeight(.medium)
                        .font(.system(size: 16))
                }
                .frame(width : 99, height: 160)
                .background(offset == 0 ? Color.yellow: Color.white)
                .modifier(CardModifier())
                
            }
            }.padding([.top, .bottom])
            
        }
        
    }}

struct HourlyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastView(hourlyForecast: WeatherService.shared.json.hourly)
    }
}
