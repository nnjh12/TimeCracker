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
        DisplayLogs(tasks: tasks.tasks, logs: logs.logs)
    }
}

struct DisplayLogs: View {
    var tasks: [Task]
    var logs: [Log]
    
    var body: some View {
        ScrollView {
            ForEach(logs) { log in
                LogRow(tasks: tasks, log: log)
            }
        }
    }
}
