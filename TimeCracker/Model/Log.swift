//
//  Log.swift
//  TimeCracker
//
//  Created by Gina on 6/8/23.
//

import Foundation

struct Log: Identifiable, Hashable {
    var id = UUID().uuidString
    var taskId: String
    var clockInTime: Date?
    var clockOutTime: Date?
    
    func convertDateToString(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MM-dd-yyyy h:mm a"
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
    
    func deleteLog(log: Log) -> Void {
        if let index = self.logs.firstIndex(of: log) {
            logs.remove(at: index)
        }
    }
    
    func editLog(log: Log, clockIn: Date, clockOut: Date) -> Void {
        if let index = self.logs.firstIndex(of: log) {
            logs[index].clockInTime = clockIn
            logs[index].clockOutTime = clockOut
        }
    }
}
