//
//  LogRow.swift
//  TimeCracker
//
//  Created by Gina on 6/8/23.
//

import SwiftUI

struct LogRow: View {
    var tasks: [Task]
    var log: Log
    
    var body: some View {
        HStack {
            Text(tasks[tasks.firstIndex(where: {$0.id == log.taskId}) ?? 0].label)
            Text(log.convertDateToString(date: log.clockInTime ?? Date(timeIntervalSince1970: 0)))
            Text(log.convertDateToString(date: log.clockOutTime ?? Date(timeIntervalSince1970: 0)))
        }
    }
}
