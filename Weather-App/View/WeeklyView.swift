//
//  WeeklyView.swift
//  Weather-App
//
//  Created by Moazam Mir on 1/25/21.
//

import SwiftUI

struct WeeklyView: View {
    var body: some View {
        VStack
        {
            
        
        Text("Looking Ahead")
        ScrollView{
            
        
        VStack{
            ForEach(0...4, id : (\.self)) {  _ in
                WeeklyTemperatureView()
               Spacer()
            }
        }
        }
        }
    }
}

struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView()
    }
}
