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
    
    func convertDateToString(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MM-dd-yy h:mm a"
        if date == Date(timeIntervalSince1970: 0) {
            return ""
        }
        return dateFormatter.string(from: date)
    }
}

class Logs: ObservableObject {
    @Published var logs: [Log]
    
    init() {
        self.logs = []
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
}
