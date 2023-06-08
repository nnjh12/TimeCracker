//
//  EditButton.swift
//  TimeCracker
//
//  Created by Gina on 6/2/23.
//

import SwiftUI

/// A view where users can their button features.
struct EditButton: View {
    var task: Task
    @Binding var isEditMode: Bool
    
    var body: some View {
        VStack {
            // Close Button
            CloseButton(onClick: {() -> Void in isEditMode = false})
            
            Text("Edit Button")
            Text(task.label)
        }
    }
}
