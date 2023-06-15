//
//  Log.swift
//  TimeCracker
//
//  Created by Gina on 6/8/23.
//

import Foundation

struct Log: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var taskId: String
    var clockInTime: Date?
    var clockOutTime: Date?
}

class Logs: ObservableObject {
    @Published var logs: [Log]
    @Published var filters: [String: Bool] = [:]
    
    init() {
        self.logs = [
            Log(taskId: "01", clockInTime: Date())
        ]
    }
    
    func addLog(log: Log) -> Void {
        self.logs.append(log)
    }
    
    func deleteLog(id: String) -> Void {
        if let index = self.logs.firstIndex(where: { $0.id == id }) {
            logs.remove(at: index)
        }
    }
    
    func editLog(id: String, clockInTime: Date, clockOutTime: Date) -> Void {
        if let index = self.logs.firstIndex(where: { $0.id == id }) {
            logs[index].clockInTime = clockInTime
            logs[index].clockOutTime = clockOutTime
        }
    }
    
    func addClockOutTime(id: String, clockOutTime: Date) -> Void {
        if let index = self.logs.firstIndex(where: { $0.id == id }) {
            logs[index].clockOutTime = clockOutTime
        }
    }
    
    func updateFilter(taskId: String) -> Void {
        if filters[taskId] != nil {
            filters[taskId]?.toggle()
        } else {
            filters[taskId] = true
        }
    }
}
