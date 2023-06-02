//
//  ClockInButton.swift
//  TimeCracker
//
//  Created by Gina on 6/1/23.
//

import SwiftUI

/// A view that displays a button for task that only needs clock in.
/// - Parameter label: task's label name
/// - Parameter color: button color
/// - Parameter clockIn: a function for clock in
struct ClockInButton: View {
    var label: String
    var color: Color
    var clockIn: () -> Void // need to pass parameter?
    
    var body: some View {
        Button {
            clockIn()
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
        ClockInButton(label: "task1", color: .pink, clockIn: {() -> Void in print("button is clicked")})
    }
}
