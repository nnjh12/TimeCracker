//
//  TaskTextField.swift
//  TimeCracker
//
//  Created by Gina on 6/3/23.
//

import SwiftUI

/// A view where user can input text.
struct TaskTextField: View {
    var placeholder: String
    @State var input: String = ""
    
    var body: some View {
        TextField(placeholder, text: $input)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1)
            )
    }
}

struct TaskTextField_Previews: PreviewProvider {
    static var previews: some View {
        TaskTextField(placeholder: "example")
    }
}
