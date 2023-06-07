//
//  ClockIn.swift
//  TimeCracker
//
//  Created by Gina on 6/2/23.
//

import SwiftUI

enum Mode {
    case display, add, edit
}

/// A ClockIn's main view that handles current mode(display, edit, add).
struct ClockIn: View {
    @State private var currentMode: Mode = .display
    var body: some View {
        switch currentMode {
        case .display:
            DisplayButtonsPage(currentMode: $currentMode)
        case .add:
            AddButtonPage(currentMode: $currentMode)
        case .edit:
            EditButton()
        }
    }
}
