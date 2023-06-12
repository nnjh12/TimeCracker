//
//  ClockInView.swift
//  TimeCracker
//
//  Created by Gina on 6/2/23.
//

import SwiftUI

/// A ClockIn's main view that handles current mode(display, edit, add).
struct ClockInView: View {
    @State private var isAddMode: Bool = false
    var body: some View {
        DisplayButtonsView(isAddMode: $isAddMode)
            // In add mode, AddButtonView will show up.
            .sheet(isPresented: $isAddMode) {
                AddButtonView(isAddMode: $isAddMode)
            }
    }
}
