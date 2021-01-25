//
//  WeeklyView.swift
//  Weather-App
//
//  Created by Moazam Mir on 1/25/21.
//

import SwiftUI

struct WeeklyMainView: View {
    let tempData : [Day]
    
    @ObservedObject var weatherService = WeatherService.shared

    var body: some View {
        VStack
        {
            
        
        Text("Looking Ahead")
            .foregroundColor(.orange)
            .font(.custom("Glober", fixedSize: 20))
            .padding()
        ScrollView{
            
        
        VStack{
            ForEach((0..<5), id : (\.self)) { index  in
                Text(weatherService.weeklyData[8 * index].formattedDate)
                    .fontWeight(.bold)
                    .padding()
                
                WeeklyHelperView(tempData:weatherService.weeklyData)
               Spacer()
            }
        }
        }
        }.onAppear()
    }
}

//struct WeeklyView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeeklyView()
//    }
//}