//
//  CloseButton.swift
//  TimeCracker
//
//  Created by Gina on 6/3/23.
//

import SwiftUI

/// A view for the close button.
struct CloseButton: View {
    var onClick: () -> Void
    var body: some View {
        HStack {
            Spacer()
            Button {
                onClick()
            } label: {
                Text("close")
                Image(systemName: "xmark")
            }
        }
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton(onClick: {() -> Void in print("close button clicked")})
    }
}
