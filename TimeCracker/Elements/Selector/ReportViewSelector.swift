//
//  ReportViewSelector.swift
//  TimeCracker
//
//  Created by Gina on 8/12/23.
//

import SwiftUI

struct ReportViewSelector: View {
    enum ReportViewItem : String {
        case daily, weekly, monthly, yearly
        var description : String {
            switch self {
            case .daily: return "Daily"
            case .weekly: return "Weekly"
            case .monthly: return "Monthly"
            case .yearly: return "Yearly"
            }
          }
    }
    
    @State var reportViewItem: ReportViewItem = .daily
    
    
    var body: some View {
        Menu {
            Button("Daily") {
                reportViewItem = .daily
                print("day")
            }
            Button("Weekly") {
                reportViewItem = .weekly
                print("week")
            }
            Button("Monthly") {
                reportViewItem = .monthly
                print("month")
            }
            Button("Yearly") {
                reportViewItem = .yearly
                print("year")
            }

        } label: {
            Image(systemName: "line.3.horizontal")
        }
    }
}

struct ReportViewSelector_Previews: PreviewProvider {
    static var previews: some View {
        ReportViewSelector()
    }
}
