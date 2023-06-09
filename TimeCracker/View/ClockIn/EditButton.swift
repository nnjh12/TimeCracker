//
//  EditButton.swift
//  TimeCracker
//
//  Created by Gina on 6/2/23.
//

import SwiftUI

/// A view where users can their button features.
struct EditButton: View {
    @EnvironmentObject var tasks: Tasks
    @Binding var isEditMode: Bool

    private var task: Task
    @State private var label: String
    @State private var color: String
    @State private var ableToClockOut: Bool
    
    init(task: Task, isEditMode: Binding<Bool>) {
        self.task = task
        self._isEditMode = isEditMode
        self.label = task.label
        self.color = task.color
        self.ableToClockOut = task.ableToClockOut
    }
    
    var body: some View {
        VStack {
            // Close Button
            CloseButton(onClick: {() -> Void in isEditMode = false})
            
            // Title
            TextCenterAligned(text: "Edit task")
                .font(.title)
            
            // Task's name input field
            TextLeftAligned(text: "Task's name")
                .font(.subheadline)
            TaskTextField(placeholder: label, text: $label)
            
            // Task's 'ability to clockout' selection field
            Toggle("Able to clock out", isOn: $ableToClockOut)
                .font(.subheadline)
            
            // Button color selection field
            TextLeftAligned(text: "Button color")
                .font(.subheadline)
            ColorSelector(selectedColor: $color)
            
            // Save button
            RoundedButton(text: "Save", color: .green, onClick: {tasks.editTask(id: task.id, label: label, color: color, ableToClockOut: ableToClockOut); isEditMode = false})
        }
    }
}
