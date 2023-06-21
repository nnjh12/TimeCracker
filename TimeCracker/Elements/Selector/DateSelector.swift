//
//  DateSelector.swift
//  TimeCracker
//
//  Created by Gina on 6/18/23.
//

import SwiftUI

struct DateSelector: View {
    @State private var from: Date = Date()
    @State private var to: Date = Date()
    @State var updateDateFilter: (Bool, Date) -> (Void) //(isStart, selectedDate) -> (Void)
    
    var body: some View {
        HStack {
            DatePicker("From", selection: $from, in: ...Date(), displayedComponents: [.date])
                .labelsHidden()
                .onChange(of: from) { newValue in
                    if from > to {
                        to = from
                    }
                    updateDateFilter(true, from)
                }
            DatePicker("To", selection: $to, in: ...Date(), displayedComponents: [.date])
                .labelsHidden()
                .onChange(of: to) { newValue in
                    if from > to {
                        from = to
                    }
                    updateDateFilter(false, to)
                }
        }
        
        
    }
}

