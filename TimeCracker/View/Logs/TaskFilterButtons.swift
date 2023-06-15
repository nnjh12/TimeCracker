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
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                TaskButton(taskId: "showAll", label: "Show All", color: "yellow", onClick: onClick)
                ForEach(tasks) { task in
                    TaskButton(taskId: task.id, label: task.label, color: task.color, onClick: onClick)
                }
            }
            .padding()
        }
    }
}
