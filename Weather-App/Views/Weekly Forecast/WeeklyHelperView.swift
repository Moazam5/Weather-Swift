//
//  WeeklyTemperatureView.swift
//  Weather-App
//
//  Created by Moazam Mir on 1/21/21.
//

import SwiftUI

struct WeeklyHelperView: View {
    
    let tempData : [Day]
    let index : Int  
    
    var body: some View {
        VStack (spacing : 0){
            let offset = 8
            let startIndex = offset * index
            let endIndex = startIndex + 8
            
            
            ForEach((startIndex..<endIndex)) { element  in
                let forecast = tempData[element]
                HStack{
                    Image(systemName: forecast.weather[0].conditionName)
                    Text("\(forecast.formattedTime) •")
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                    Text("\(forecast.weather[0].main)")
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                    
                    Spacer()
                    Text("\(forecast.main.minTemp)/ \(forecast.main.maxTemp)")
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

//
//struct WeeklyTemperatureView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeeklyTemperatureView(tempData: WeatherService.shared.weeklyData.list)
//    }
//}
