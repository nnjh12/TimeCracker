//
//  RoundedButton.swift
//  TimeCracker
//
//  Created by Gina on 6/3/23.
//

import SwiftUI

/// A view that displays a rounded button
struct RoundedButton: View {
    var text: String
    var color: Color
    var onClick: () -> Void
    
    var body: some View {
        Button {
            onClick()
        } label: {
            Text(text)
                .padding()
                .foregroundColor(.white)
                .bold()
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(color)
                )
        }
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(text: "rounded button", color: .pink, onClick: {() -> Void in print("rounded button clicked")})
    }
}
