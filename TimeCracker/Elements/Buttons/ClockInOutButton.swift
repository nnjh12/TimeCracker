//
//  ClockInOutButton.swift
//  TimeCracker
//
//  Created by Gina on 6/2/23.
//

import SwiftUI

/// A view that displays a button for task that needs both clock in and out.
/// - Parameter label: task's label name
/// - Parameter color: button color
/// - Parameter clockIn: a function for clock in
/// - Parameter clockOut: a function for clock out
struct ClockInOutButton: View {
    @State private var isClockedIn: Bool = false
    var label: String
    var color: Color
    var clockIn: () -> Void // need to pass parameter?
    var clockOut: () -> Void // need to pass parameter?
    
    var body: some View {
        // gradientLocation is higher when clockedIn
        let gradLoc = isClockedIn ? 0.3 : 0.1
        let background = LinearGradient(stops: [.init(color: .yellow, location: gradLoc), .init(color: color, location: gradLoc)], startPoint: .bottom, endPoint: .top)
        
        Button {
            isClockedIn ? clockOut() : clockIn()
            isClockedIn.toggle()
        } label: {
            Text(label)
                .frame(width: 150, height: 150)
                .font(.title2)
                .foregroundColor(.white)
                .background(background)
                .clipShape(Circle())
        }
    }
}

struct ClockInOutButton_Previews: PreviewProvider {
    static var previews: some View {
        ClockInOutButton(label: "clockInOut", color: .green, clockIn: {() -> Void in print("clockIn")}, clockOut: {() -> Void in print("clockOut")})
    }
}
