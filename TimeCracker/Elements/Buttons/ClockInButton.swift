//
//  ClockInButton.swift
//  TimeCracker
//
//  Created by Gina on 6/1/23.
//

import SwiftUI

/// A view that displays a button for task that only needs clock in.
struct ClockInButton: View {
    @EnvironmentObject var appColors: AppColors
    @EnvironmentObject var tasks: Tasks
    @State private var isEditMode: Bool = false
    var task: Task
        
    var body: some View {
        // Clock In Button
        Button {
            task.clockIn()
        } label: {
            Text(task.label)
                .frame(width: 150, height: 150)
                .font(.title2)
                .foregroundColor(.white)
                .background(appColors.convertStringToColor(colorName: task.color))
                .clipShape(Circle())
        }
        .contentShape(ContentShapeKinds.contextMenuPreview, Circle())
        // When user press and hold the button, options to edit and delete will appear.
        .contextMenu {
                // Button for edit
                Button {
                    isEditMode.toggle()
                    
                } label: {
                    Label("Edit", systemImage: "pencil")
                }
                // Button for delete
                Button {
                    tasks.deleteTask(task: task)
                } label: {
                    Label("Delete", systemImage: "trash")
                }
        }
        // When user select edit, edit view will appear on top of current view. 
        .sheet(isPresented: $isEditMode) {
            EditButton(task: task, isEditMode: $isEditMode)
        }
    }
}
