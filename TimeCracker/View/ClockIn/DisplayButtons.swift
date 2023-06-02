//
//  DisplayButtons.swift
//  TimeCracker
//
//  Created by Gina on 6/2/23.
//

import SwiftUI

/// A view that displays all the buttons that user saved.
struct DisplayButtons: View {
    @EnvironmentObject var tasks: Tasks
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(tasks.tasks) {task in
                    Text(task.label)
                }
            }
            .navigationTitle("Clock In")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // add button
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
        }
    }
}
