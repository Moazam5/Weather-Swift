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
    
    @ObservedObject   var weatherService = WeatherService.shared
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
            Button(action: {
               // print(weatherService.currTempData.temperature)
                weatherService.fetchWeatherData(lat: userLatitude, lon: userLongitude, weekly: false)
            }, label: {
                Image("reload")
            })
            Spacer()
            Text("Weather Forecast")
            
            Spacer()
            Button(action: {
                print(weatherService.currTempData.temperature)
            }) {
                Image("bar_menu_xs")
            }
        }.padding()
        
            CurrentView(  currentData: weatherService.currTempData)
                .padding()
            HourlyForecastView(hourlyForecast: weatherService.currTempData.hourly)
                .padding()
        
        Image("nyc")
            .resizable()
            .frame(maxWidth : 430, maxHeight: 200, alignment: .top)
            .edgesIgnoringSafeArea(.all)
            .aspectRatio(contentMode: .fill)
            .padding()
    
            
        
      
        }
        .onAppear(perform: {
            print("Fetching data")
            weatherService.fetchWeatherData(lat: userLatitude, lon: userLongitude, weekly: true)
            weatherService.fetchWeatherData(lat: userLatitude, lon: userLongitude, weekly : false)
            print("Currnet temp", weatherService.currTempData.temperature)

        })
        
        
    
    }
    
}



struct ContentView_Preview : PreviewProvider
{
    static var previews: some View{
        ContentView()
    }
}
