//
//  LogRowHeader.swift
//  TimeCracker
//
//  Created by Gina on 6/8/23.
//

import SwiftUI

/// A view that displays log row's header.
struct LogRowHeader: View {
    var body: some View {
        HStack {
            Text("Clock In")
                .frame(width: 130, alignment: .leading)
            Text("Clock Out")
                .frame(width: 150, alignment: .leading)
            Text("Task")
                .frame(width: 70, alignment: .leading)
        }
        .padding(.bottom)
    }
}
