//
//  ClockInOutButton.swift
//  TimeCracker
//
//  Created by Gina on 6/2/23.
//

import SwiftUI

/// A view that displays a button for task that needs both clock in and out.
struct ClockInOutButton: View {
    @EnvironmentObject var appColors: AppColors
    @EnvironmentObject var tasks: Tasks
    @EnvironmentObject var logs: Logs
    @State private var isClockedIn: Bool = false
    @State private var clockedInId: String = ""
    @State private var isEditMode: Bool = false
    
    var task: Task
    
    func clockIn(task: Task) {
        print("\(task.label) clockIn")
        let log = Log(taskId: task.id, clockInTime: Date(), clockOutTime: nil)
        logs.addLog(log: log)
        isClockedIn.toggle()
        clockedInId = log.id
    }
    
    func clockOut(task: Task) {
        print("\(task.label) clockOut")
        logs.addClockOutTime(id: clockedInId, clockOutTime: Date())
        isClockedIn.toggle()
        clockedInId = ""
    }
    
    var body: some View {
        // gradientLocation is higher when clockedIn
        let gradLoc = isClockedIn ? 0.3 : 0.1
        let background = LinearGradient(stops: [.init(color: .yellow, location: gradLoc), .init(color: appColors.convertStringToColor(colorName: task.color), location: gradLoc)], startPoint: .bottom, endPoint: .top)
        
        // Clock In and Out Button
        Button {
            isClockedIn ? self.clockOut(task: task) : self.clockIn(task: task)
        } label: {
            Text(task.label)
                .frame(width: 150, height: 150)
                .font(.title2)
                .foregroundColor(.white)
                .background(background)
                .clipShape(Circle())
        }
        .contentShape(ContentShapeKinds.contextMenuPreview, Circle())
        // When user press and hold the button, options to edit and delete will appear.
        .contextMenu {
                // Button for edit
                Button {
                    isEditMode.toggle()
                } label: {
                    Label("Edit", systemImage: "pencil")
                }
                // Button for delete
                Button {
                    tasks.deleteTask(id: task.id)
                } label: {
                    Label("Delete", systemImage: "trash")
                }
        }
        // When user select edit, edit view will appear on top of current view.
        .sheet(isPresented: $isEditMode) {
            EditButton(task: task, isEditMode: $isEditMode)
        }
    }
}
