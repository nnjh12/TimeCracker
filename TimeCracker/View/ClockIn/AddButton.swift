//
//  AddButton.swift
//  TimeCracker
//
//  Created by Gina on 6/2/23.
//

import SwiftUI

/// A view where users can add a button.
struct AddButtonPage: View {
    @EnvironmentObject var tasks: Tasks
    @Binding var currentMode: mode
    
    @State private var label: String = ""
    @State private var ableToClockOut: Bool = false
    @State private var color: String = "green"
    
    var body: some View {
        VStack {
            // Close Button
            CloseButton(onClick: {() -> Void in currentMode = .display})
            
            // Title
            TextCenterAligned(text: "Add a new task")
                .font(.title)
            
            // Task's name input field
            TextLeftAligned(text: "Task's name")
                .font(.subheadline)
            TaskTextField(placeholder: "Enter your task's name", text: $label)
            
            // Task's 'ability to clockout' selection field
            Toggle("Able to clock out", isOn: $ableToClockOut)
                .font(.subheadline)
            
            // Button color selection field
            TextLeftAligned(text: "Button color")
                .font(.subheadline)
            ColorSelector(selectedColor: $color)
            
            // Save button
            RoundedButton(text: "Save", color: .green, onClick: {tasks.addTask(task: Task(label: label, color: color, ableToClockOut: ableToClockOut)); currentMode = .display})
        }
        .padding()
    }
}
