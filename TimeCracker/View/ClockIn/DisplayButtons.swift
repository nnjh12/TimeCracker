//
//  DisplayButtons.swift
//  TimeCracker
//
//  Created by Gina on 6/2/23.
//

import SwiftUI

/// A view that displays all the buttons, navigation title, and add button.
struct DisplayButtonsView: View {
    @EnvironmentObject var tasks: Tasks
    @Binding var isAddMode: Bool
    var body: some View {
        NavigationView {
            DisplayButtons(tasks: tasks.tasks, delete: tasks.deleteTask)
            // A navigation title
            .navigationTitle("Clock In")
            // An add button on navigation bar
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isAddMode = true
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
    let delete: (String) -> Void
    
    var body: some View {
        ScrollView {
            // Display buttons in two columns.
            LazyVGrid(columns: columns) {
                ForEach(tasks) {task in
                    // If user delete task, do not display it.
                    if task.notDeleted {
                        // If task can be clocked out, show ClockInOutButton.
                        if (task.ableToClockOut) {
                            ClockInOutButton(task: task)
                        // If task cannot be clocked out, show ClockInButton.
                        } else {
                            ClockInButton(task: task)
                        }
                    }
                }
            }
        }
    }
}
