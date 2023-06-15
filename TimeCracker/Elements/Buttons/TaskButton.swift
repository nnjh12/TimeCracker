//
//  TaskButton.swift
//  TimeCracker
//
//  Created by Gina on 6/12/23.
//

import SwiftUI

/// A view that displays a task button.
struct TaskButton: View {
    @EnvironmentObject var appColors: AppColors
    var task: Task
    var onClick: (String) -> Void
    
    @State var isSelected: Bool = false
    
    var body: some View {
        Button {
            onClick(task.id)
            isSelected.toggle()
        } label: {
            Text(task.label)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(appColors.convertStringToColor(colorName: task.color))
                )
                .foregroundColor(.white)
                // The border will be displayed in the selectes color.
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(.yellow, lineWidth: isSelected ? 3 : 0)
                )
        }
    }
}
