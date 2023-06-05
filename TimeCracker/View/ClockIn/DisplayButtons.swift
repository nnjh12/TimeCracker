//
//  DisplayButtons.swift
//  TimeCracker
//
//  Created by Gina on 6/2/23.
//

import SwiftUI

/// A view that displays all the buttons, navigation title, and add button.
struct DisplayButtonsPage: View {
    @EnvironmentObject var appColors: AppColors
    @EnvironmentObject var tasks: Tasks
    @Binding var currentMode: mode
    var body: some View {
        NavigationView {
            DisplayButtons(tasks: tasks.tasks)
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
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(tasks) {task in
                    if (task.ableToClockOut) {
                        ClockInOutButton(task: task)
                    } else {
                        ClockInButton(task: task)
                    }
                }
            }
        }
    }
}
