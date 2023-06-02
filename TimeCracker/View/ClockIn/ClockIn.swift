//
//  ClockIn.swift
//  TimeCracker
//
//  Created by Gina on 6/2/23.
//

import SwiftUI

enum mode {
    case display, edit, add
}

/// A main view for clock in.
struct ClockIn: View {
    @State private var currentMode: mode = .display
    var body: some View {
        switch currentMode {
        case .display:
            DisplayButtons()
        case .edit:
            EditButton()
        case .add:
            AddButton()
        }

    }
}

struct ClockIn_Previews: PreviewProvider {
    static var previews: some View {
        ClockIn()
    }
}
