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
                ForEach(tasks) { task in
                    TaskButton(task: task, onClick: onClick)
                }
            }
            .padding()
        }
    }
}
