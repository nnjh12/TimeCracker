//
//  ClockIn.swift
//  TimeCracker
//
//  Created by Gina on 6/2/23.
//

import SwiftUI

/// A ClockIn's main view that handles current mode(display, edit, add).
struct ClockInView: View {
    @State private var isAddMode: Bool = false
    var body: some View {
        DisplayButtonsPage(isAddMode: $isAddMode)
            .sheet(isPresented: $isAddMode) {
                AddButtonPage(isAddMode: $isAddMode)
            }
    }
}
