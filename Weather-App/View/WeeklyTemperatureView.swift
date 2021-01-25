//
//  WeeklyTemperatureView.swift
//  Weather-App
//
//  Created by Moazam Mir on 1/21/21.
//

import SwiftUI

struct WeeklyTemperatureView: View {
    @ObservedObject var weatherService = WeatherService.shared
  //  var tempData : WeeklyAPI
    
    var body: some View {
        
        
        VStack (spacing : 0){
            ForEach(0...7, id : (\.self)){_ in
                
            
            HStack{
                Image(systemName: "cloud")
                Text("Today •")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                
                Text("Sunny")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                Spacer()
                Text("25º / 30º")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
            }.padding()
            .padding([.leading,.trailing])
        }
          
        }
        .background(Color.white)
        .modifier(CardModifier())
        
    }
    
}

struct WeeklyTemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyTemperatureView()
    }
}
