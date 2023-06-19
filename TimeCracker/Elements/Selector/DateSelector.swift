//
//  DateSelector.swift
//  TimeCracker
//
//  Created by Gina on 6/18/23.
//

import SwiftUI

struct DateSelector: View {
    @State private var from = Date()
    @State private var to = Date()
    
    var body: some View {
        HStack {
            DatePicker("From", selection: $from, displayedComponents: [.date])
            DatePicker("To", selection: $to, displayedComponents: [.date])
        }
        
        
    }
}

struct DateSelector_Previews: PreviewProvider {
    static var previews: some View {
        DateSelector()
    }
}
