//
//  AppView.swift
//  Weather-App
//
//  Created by Moazam Mir on 1/21/21.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem {
                    Image(systemName: "sun.max")
                    Text("Daily")
                }
            WeeklyMainView(tempData: [])
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Weekly")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
