//
//  LogView.swift
//  TimeCracker
//
//  Created by Gina on 6/8/23.
//

import SwiftUI

struct LogView: View {
    @EnvironmentObject var tasks: Tasks
    @EnvironmentObject var logs: Logs
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                LogRowHead()
                Divider()
                DisplayLogs(tasks: tasks.tasks, logs: logs.logs)
                .navigationTitle("Logs")
            }
//            .padding()
        }
    }
}

struct DisplayLogs: View {
    var tasks: [Task]
    var logs: [Log]
    
    var body: some View {
        List(logs) { log in
            LogRow(tasks: tasks, log: log)
        }
        .frame(maxWidth: .infinity)
        .edgesIgnoringSafeArea(.all)
        .listStyle(PlainListStyle())
    }
}
