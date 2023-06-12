//
//  TaskButton.swift
//  TimeCracker
//
//  Created by Gina on 6/12/23.
//

import SwiftUI

/// A view that displays a task button.
struct TaskButton: View {
//    var task: Task
//    var onClick: (Task) -> Void
    @State var isSelected: Bool = false
    
    var body: some View {
        Button {
//            onClick(task)
            isSelected.toggle()
        } label: {
            Text("example")
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(.orange)
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

struct TaskButton_Previews: PreviewProvider {
    static var previews: some View {
        TaskButton()
    }
}
