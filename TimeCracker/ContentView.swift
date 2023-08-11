//
//  ContentView.swift
//  TimeCracker
//
//  Created by Gina on 5/31/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var tasks = Tasks()
    @StateObject var logs = Logs()
    @StateObject var appColors = AppColors()
    @State private var selection = 1
    var body: some View {
        TabView(selection: $selection) {
            ClockInView()
                .tabItem {
                    Label("Clock In", systemImage: "clock")
                }
                .tag(1)
            
            LogView()
                .tabItem {
                    Label("Logs", systemImage: "line.3.horizontal")
                }
                .tag(2)
            ReportView()
                .tabItem {
                    Label("Report", systemImage: "menucard")
                }
                .tag(3)
        }
        .environmentObject(tasks)
        .environmentObject(logs)
        .environmentObject(appColors)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
