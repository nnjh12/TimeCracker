//
//  ContentView.swift
//  TimeCracker
//
//  Created by Gina on 5/31/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var tasks = Tasks()
    @State private var selection = 1
    var body: some View {
        TabView(selection: $selection) {
            ClockIn()
                .tabItem {
                    Label("Clock In", systemImage: "clock")
                }
        }
        .environmentObject(tasks)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
