//
//  ContentView.swift
//  TimeCracker
//
//  Created by Gina on 5/31/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, time cracker!")
            ClockInButton(label: "task1", color: .pink, clockIn: {() -> Void in print("button is clicked")})
            ClockInOutButton(label: "clockInOut", color: .green, clockIn: {() -> Void in print("clockIn")}, clockOut: {() -> Void in print("clockOut")})
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
