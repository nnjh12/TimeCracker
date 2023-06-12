//
//  LogRow.swift
//  TimeCracker
//
//  Created by Gina on 6/8/23.
//

import SwiftUI

/// A view that displays one log in a row.
struct LogRow: View {
    var tasks: [Task]
    var log: Log
   
    /// A function that converts Date to String (e.g. 06-12-20 10:53 AM).
    func convertDateToString(date: Date?) -> String {
        if (date == nil) {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MM-dd-yy h:mm a"
        return dateFormatter.string(from: date ?? Date(timeIntervalSince1970: 0))
    }

    /// A function that converts seconds to hours, minutes, and seconds.
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    /// A function that convert a duration between two dates to String (e.g. (1h 20m 5s)).
    func displayDuration(from: Date?, to: Date?) -> String {
        if (to == nil) {
            return ""
        }
        let duration = Int(to?.timeIntervalSince(from ?? Date(timeIntervalSince1970: 0)) ?? 0)
        if (duration == 0) {
            return "(0S)"
        }
        let (h,m,s) = secondsToHoursMinutesSeconds(duration)
        let hour = h > 0 ? "\(h)h " : ""
        let min = m > 0 ? "\(m)m " : ""
        let sec = s > 0 ? "\(s)s" : ""
        return ("(\(hour)\(min)\(sec))")
    }
    
    var body: some View {
        HStack {
            // Clock in time
            Text(convertDateToString(date: log.clockInTime))
                .frame(width: 130, alignment: .leading)
            // Clock out time and duration
            Text("\(convertDateToString(date: log.clockOutTime)) \(displayDuration(from: log.clockInTime, to: log.clockOutTime))")
                .frame(width: 150, alignment: .leading)
            // Task's name
            Text(tasks[tasks.firstIndex(where: {$0.id == log.taskId}) ?? 0].label)
                .frame(width: 70, alignment: .leading)
        }
        .font(.footnote)
    }
}
