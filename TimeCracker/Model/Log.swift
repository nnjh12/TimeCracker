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
    @Published var dateFilters: (Date?, Date?) // (from, to)
    @Published var filters: [String] = []
    
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
            self.logs.remove(at: index)
        }
    }
    
    func editLog(id: String, clockInTime: Date, clockOutTime: Date) -> Void {
        if let index = self.logs.firstIndex(where: { $0.id == id }) {
            self.logs[index].clockInTime = clockInTime
            self.logs[index].clockOutTime = clockOutTime
        }
    }
    
    func addClockOutTime(id: String, clockOutTime: Date) -> Void {
        if let index = self.logs.firstIndex(where: { $0.id == id }) {
            self.logs[index].clockOutTime = clockOutTime
        }
    }
    
    func updateFilter(taskId: String) -> Void {
        if taskId == "showAll" {
            self.filters = []
        } else {
            if let index = filters.firstIndex(where: { $0 == taskId}) {
                self.filters.remove(at: index)
            } else {
                self.filters.append(taskId)
            }
        }
    }
    
    func updateDateFilter(isStart: Bool, date: Date) -> Void {
        if isStart {
           self.dateFilters.0 = date
        } else {
            self.dateFilters.1 = date
        }
    }
    
    func isLogbetween (log: Log, from: Date?, to: Date?) -> Bool {
        let compareWithFrom = Calendar.current.compare(log.clockInTime!, to: from ?? Date(timeIntervalSince1970: 0), toGranularity: .day)
        let compareWithTo = Calendar.current.compare(log.clockOutTime ?? log.clockInTime!, to: to ?? Date(), toGranularity: .day)
        return compareWithFrom != .orderedAscending && compareWithTo != .orderedDescending
    }
    
    func filterLogs(logs:[Log]) -> [Log] {
        // filter by dates
        let filteredByDate = (self.dateFilters.0 == nil && self.dateFilters.1 == nil) ? logs : logs.filter {isLogbetween(log: $0, from: self.dateFilters.0, to: self.dateFilters.1)}
        // filter by tasks
        let filteredByTask = self.filters.isEmpty ? filteredByDate : filteredByDate.filter {self.filters.contains($0.taskId)}
        return filteredByTask
    }
    
    func sortLogs(logs:[Log], comparisonResult: ComparisonResult, sortItem: SortButton.SortItem) -> [Log] {
        var sortedLogs = logs
        if (sortItem == .clockOut) {
            sortedLogs = logs.sorted(by: {$0.clockOutTime?.compare($1.clockOutTime ?? Date(timeIntervalSince1970: 0)) == comparisonResult})
        }
        else {
            sortedLogs = logs.sorted(by: {$0.clockInTime!.compare($1.clockInTime!) == comparisonResult})
        }
        return sortedLogs
    }
    
    func displayLogs(logs:[Log], comparisonResult: ComparisonResult, sortItem: SortButton.SortItem) -> [Log] {
        var result = filterLogs(logs: logs)
        result = sortLogs(logs: result, comparisonResult: comparisonResult, sortItem: sortItem)
        return result
    }
}
