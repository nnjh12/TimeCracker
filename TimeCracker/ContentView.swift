//
//  ContentView.swift
//  TimeCracker
//
//  Created by Gina on 5/31/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var tasks = Tasks()
    var body: some View {
        DisplayButtons()
        .environmentObject(tasks)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
