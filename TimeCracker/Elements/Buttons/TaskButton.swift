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
    var taskId: String
    var label: String
    var color: String
    var onClick: (String) -> Void
    var isSelected: Bool
    
    var body: some View {
        Button {
            onClick(taskId)
        } label: {
            Text(label)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(appColors.convertStringToColor(colorName: color))
                )
                .foregroundColor(.white)
                // The border will be displayed in the selectes color.
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(.brown, lineWidth: isSelected ? 3 : 0)
                )
        }
    }
}

//struct TaskButton_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskButton(taskId: "01", label: "example", color: "orange", onClick: {(string) -> Void in print(string)}, isSelected: false)
//    }
//}
