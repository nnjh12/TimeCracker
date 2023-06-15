//
//  LogView.swift
//  TimeCracker
//
//  Created by Gina on 6/8/23.
//

import SwiftUI

/// A Log's main view that displays date selector, task buttons, log header, and all the recorded logs.
struct LogView: View {
    @EnvironmentObject var tasks: Tasks
    @EnvironmentObject var logs: Logs
        
    var body: some View {
        
        NavigationView {
            VStack(spacing: 0) {
                // Task filter buttons
                TaskFilterButtons(tasks: tasks.tasks, onClick: logs.updateFilter)
                
                // Log header
                LogRowHeader()
                Divider()
                DisplayLogs(tasks: tasks.tasks, logs: logs.logs, filters: logs.filters)
                .navigationTitle("Logs")
            }
        }
    }
}

/// A view that displays all logs.
struct DisplayLogs: View {
    var tasks: [Task]
    var logs: [Log]
    var filters: [String: Bool]
       
    var body: some View {
        List(logs) { log in
            if filters.values.allSatisfy({!$0}) {
                LogRow(tasks: tasks, log: log)
            } else {
                if filters[log.taskId] != nil {
                    if filters[log.taskId]! {
                        LogRow(tasks: tasks, log: log)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .edgesIgnoringSafeArea(.all)
        .listStyle(PlainListStyle())
    }
}
