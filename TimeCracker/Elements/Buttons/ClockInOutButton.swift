//
//  ClockInOutButton.swift
//  TimeCracker
//
//  Created by Gina on 6/2/23.
//

import SwiftUI

/// A view that displays a button for task that needs both clock in and out.
struct ClockInOutButton: View {
    var task: Task
    var edit: (Task) -> Void
    var delete: (Task) -> Void
    
    var body: some View {
        ClockInOutButtonUI(label: task.label, color: task.color, clockIn: task.clockIn, clockOut: task.clockOut)
            .contentShape(ContentShapeKinds.contextMenuPreview, Circle())
            .contextMenu {
                    Button {
                        edit(task)
                    } label: {
                        Label("Edit", systemImage: "pencil")
                    }
                    Button {
                        delete(task)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
            }
    }
}

struct ClockInOutButtonUI: View {
    @EnvironmentObject var appColors: AppColors
    @State private var isClockedIn: Bool = false
    var label: String
    var color: String
    var clockIn: () -> Void // need to pass parameter?
    var clockOut: () -> Void // need to pass parameter?
    
    var body: some View {
        // gradientLocation is higher when clockedIn
        let gradLoc = isClockedIn ? 0.3 : 0.1
        let background = LinearGradient(stops: [.init(color: .yellow, location: gradLoc), .init(color: appColors.convertStringToColor(colorName: color), location: gradLoc)], startPoint: .bottom, endPoint: .top)
        
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

struct ClockInOutButtonUI_Previews: PreviewProvider {
    static var previews: some View {
        ClockInOutButtonUI(label: "clockInOut", color: "green", clockIn: {() -> Void in print("clockIn")}, clockOut: {() -> Void in print("clockOut")})
    }
}
