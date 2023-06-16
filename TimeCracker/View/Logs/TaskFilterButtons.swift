//
//  TaskFilterButtons.swift
//  TimeCracker
//
//  Created by Gina on 6/13/23.
//

import SwiftUI

struct TaskFilterButtons: View {
    var tasks: [Task]
    var onClick: (String) -> Void
    var filters: [String]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                // Show All button
                TaskButton(taskId: "showAll", label: "Show All", color: "yellow", onClick: onClick, isSelected: filters.isEmpty)
                // Tasks button
                ForEach(tasks) { task in
                    TaskButton(taskId: task.id, label: task.label, color: task.color, onClick: onClick, isSelected: filters.contains(task.id))
                }
            }
            .padding()
        }
    }
}
