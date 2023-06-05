//
//  AddButton.swift
//  TimeCracker
//
//  Created by Gina on 6/2/23.
//

import SwiftUI

/// A view where users can add a button.
struct AddButtonPage: View {
    @Binding var currentMode: mode
    
    @State private var label: String = ""
    @State private var ableToClockOut: Bool = false
    @State private var color: (String, Color) = ("white", .white)
    
    
    var body: some View {
        VStack {
            CloseButton(onClick: {() -> Void in currentMode = .display})
            TextLeftAligned(text: "Task's name")
                .font(.subheadline)
            TaskTextField(placeholder: "Enter your task's name", text: $label)
            Toggle("Able to clock out", isOn: $ableToClockOut)
                .font(.subheadline)
            
            TextLeftAligned(text: "Button color")
                .font(.subheadline)
            ColorSelector(selectedColor: $color)
            
            RoundedButton(text: "Save", color: .green, onClick: {() -> Void in print("\(label) & \(ableToClockOut) & \(color.1)"); currentMode = .display})
        }
        .padding()
    }
}
