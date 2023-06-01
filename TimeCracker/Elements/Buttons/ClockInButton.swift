//
//  ClockInButton.swift
//  TimeCracker
//
//  Created by Gina on 6/1/23.
//

import SwiftUI

struct ClockInButton: View {
    @State var label: String
    @State var color: Color
    var onClick: () -> Void
    
    var body: some View {
        Button {
            onClick()
        } label: {
            Text(label)
                .frame(width: 150, height: 150)
                .font(.title2)
                .foregroundColor(.white)
                .background(color)
                .clipShape(Circle())
        }
    }
}

struct ClockInButton_Previews: PreviewProvider {
    static var previews: some View {
        ClockInButton(label: "task1", color: .pink, onClick: {() -> Void in print("button is clicked")})
    }
}
