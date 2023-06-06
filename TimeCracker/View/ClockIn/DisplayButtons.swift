//
//  DisplayButtons.swift
//  TimeCracker
//
//  Created by Gina on 6/2/23.
//

import SwiftUI

/// A view that displays all the buttons, navigation title, and add button.
struct DisplayButtonsPage: View {
    @EnvironmentObject var tasks: Tasks
    @Binding var currentMode: mode
    var body: some View {
        NavigationView {
            DisplayButtons(tasks: tasks.tasks, delete: tasks.deleteTask)
            .navigationTitle("Clock In")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        currentMode = .add
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

/// A view that displays all the buttons that user saved in two columns.
struct DisplayButtons: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let tasks: [Task]
    let delete: (Task) -> Void
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(tasks) {task in
                    if (task.ableToClockOut) {
                        ClockInOutButton(task: task, edit: {(task) -> Void in print("edit \(task.label)")}, delete: delete)
                    } else {
                        ClockInButton(task: task, edit: {(task) -> Void in print("edit \(task.label)")}, delete: delete)
                    }
                }
            }
        }
    }
}
