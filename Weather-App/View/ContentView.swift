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
    var weatherManager = WeatherManager()
    var coreLocation = CLLocationManager()
   
    var body: some View {
        
        HStack{
            Spacer()
            Text("Forecast")
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image("bar_menu_xs")
            }
        }
        
//        VStack (alignment : .leading)
//        {
//            Text("23 Fhi")
//                .font(.title)
//                .fontWeight(.bold)
//            Text("Sunny")
//                .font(.title2)
//            Button(action: {
//                weatherManager.fetchCurrentWeather(cityName: "london")
//
//            }, label: {
//                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
//            })
//        }.padding()
        
        
      
    }
    
}



struct ContentView_Preview : PreviewProvider
{
    static var previews: some View{
        ContentView()
    }
}
