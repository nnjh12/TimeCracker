//
//  Task.swift
//  TimeCracker
//
//  Created by Gina on 6/1/23.
//

import Foundation
import SwiftUI

struct Task: Identifiable, Hashable {
    var id = UUID().uuidString // is it better to have firebase id?
    var label: String
    var buttonColor: Color
    var ableToClockOut: Bool
}

class Tasks: ObservableObject {
    @Published var tasks: [Task]
    
    init() {
        self.tasks = [
            Task(label: "task1", buttonColor: .red, ableToClockOut: false),
            Task(label: "task2", buttonColor: .orange, ableToClockOut: true),
            Task(label: "task3", buttonColor: .green, ableToClockOut: true),
            Task(label: "task4", buttonColor: .blue, ableToClockOut: false),
            Task(label: "task5", buttonColor: .pink, ableToClockOut: false)
        ]
    }
    
}
