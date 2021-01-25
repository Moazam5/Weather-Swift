//
//  ContentView.swift
//  Weather-App
//
//  Created by Moazam Mir on 1/21/21.
//

import SwiftUI
import CoreLocation

struct ContentView : View
{
    
    @ObservedObject var weatherService = WeatherService.shared
    @ObservedObject var locationManager = LocationManager()
    
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 39.327)"
       }

    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? -74.616)"
       }
   
    var body: some View {
        VStack(spacing : 15)
        {
            
        
        HStack{
            Button(action: {}, label: {
               // Text("Button")
                Image("reload_weather")
            })
            Spacer()
            Text("Weather Forecast")
            
            Spacer()
            Button(action: {
                print(weatherService.currentTemperatureData.temperature)
            }) {
                Image("bar_menu_xs")
            }
        }.padding()
        
            CurrentView(current: weatherService.json.current, city: weatherService.city, currentData: weatherService.currentTemperatureData)
                .padding()
            HourlyForecastView(hourlyForecast: weatherService.json.hourly)
                .padding()
        
        Image("jamia_one")
            .resizable()
            .frame(maxWidth : 430, maxHeight: 200, alignment: .top)
            .edgesIgnoringSafeArea(.all)
            .aspectRatio(contentMode: .fit)
            .padding()
    
            
        
      
        }
      //  .padding()
      //  .resizable()
        .onAppear(perform: {
            weatherService.fetchCity()
            weatherService.fetchWeather(lat: userLatitude, lon: userLongitude)
        })
        
        
    
    }
    
}



struct ContentView_Preview : PreviewProvider
{
    static var previews: some View{
        ContentView()
    }
}
