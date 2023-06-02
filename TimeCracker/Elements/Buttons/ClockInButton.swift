//
//  ClockInButton.swift
//  TimeCracker
//
//  Created by Gina on 6/1/23.
//

import SwiftUI

/// A view that displays a button for task that only needs clock in.
struct ClockInButton: View {
    var task: Task = Task(label: "example", color: .pink, ableToClockOut: false)
    var body: some View {
        ClockInButtonUI(label: task.label, color: task.color, clockIn: task.clockIn)
    }
}

struct ClockInButtonUI: View {
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

struct ClockInButtonUI_Previews: PreviewProvider {
    static var previews: some View {
        ClockInButtonUI(label: "example", color: .pink, clockIn: {() -> Void in print("clockIn")})
    }
}
