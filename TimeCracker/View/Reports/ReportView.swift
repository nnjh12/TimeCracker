//
//  ReportView.swift
//  TimeCracker
//
//  Created by Gina on 8/4/23.
//

import SwiftUI

struct ReportView: View {
    @EnvironmentObject var tasks: Tasks
    @EnvironmentObject var logs: Logs
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Date selector
                DateSelector(updateDateFilter: logs.updateDateFilter)
                
                // Task filter buttons
                TaskFilterButtons(tasks: tasks.tasks, onClick: logs.updateFilter, filters: logs.filters)
                
                .navigationBarTitle("Report")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        ReportViewSelector()
                    }
                }
            }
        }
    }
}
