//
//  CurrentView.swift
//  Weather-App
//
//  Created by Moazam Mir on 1/24/21.
//  Helper view to make the weaher card view

import SwiftUI

struct CurrentView: View {
    
    let currentData : CurrentWeatherModel
    
    var body: some View {
      
        VStack {
            HStack{
                Image(systemName: currentData.conditionName)
                    .foregroundColor(.orange)
                
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
                .foregroundColor(.orange)
            Text(currentData.city)
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
        CurrentView(currentData: WeatherService.shared.currTempData)
    }
}

