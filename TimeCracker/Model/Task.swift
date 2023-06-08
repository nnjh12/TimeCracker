//
//  Task.swift
//  TimeCracker
//
//  Created by Gina on 6/1/23.
//

import Foundation

struct Task: Identifiable, Hashable {
    var id = UUID().uuidString // is it better to have firebase id?
    var label: String
    var color: String
    var ableToClockOut: Bool
    
    func clockIn(logs: Logs) {
        print("\(self.label) clockIn")
        let log = Log(taskId: self.id, clockInTime: Date(), clockOutTime: nil)
        logs.addLog(log: log)
    }
    func clockOut() {
        print("\(self.label) clockOut")
    }
}

class Tasks: ObservableObject {
    @Published var tasks: [Task]
    
    init() {
        self.tasks = [
            Task(label: "task1", color: "red", ableToClockOut: false),
            Task(label: "task2", color: "orange", ableToClockOut: true),
            Task(label: "task3", color: "green", ableToClockOut: true),
            Task(label: "task4", color: "blue", ableToClockOut: false),
            Task(label: "task5", color: "purple", ableToClockOut: false)
        ]
    }
    
    func addTask(task: Task) -> Void {
        self.tasks.append(task)
    }
    
    func deleteTask(task: Task) -> Void {
        if let index = self.tasks.firstIndex(of: task) {
            tasks.remove(at: index)
        }
    }
    
    func editTask(task: Task, label: String, color: String, ableToClockOut: Bool ) -> Void {
        if let index = self.tasks.firstIndex(of: task) {
            tasks[index].label = label
            tasks[index].color = color
            tasks[index].ableToClockOut = ableToClockOut
        }
    }
    
}


