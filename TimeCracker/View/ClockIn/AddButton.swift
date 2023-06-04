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
    var body: some View {
        VStack {
            CloseButton(onClick: {() -> Void in currentMode = .display})
            TextLeftAligned(text: "Task's name")
                .font(.subheadline)
            TaskTextField(placeholder: "Enter your task's name")
            
            RoundedButton(text: "Save", color: .green, onClick: {() -> Void in print("done")})
        }
        .padding()
    }
}
