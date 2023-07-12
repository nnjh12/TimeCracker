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
            SortButton(label: "Clock In", isSortItem: true)
                .frame(width: 130)
            Rectangle().fill(Color.gray).frame(width: 0.5, height: 20)
            SortButton(label: "Clock Out", isSortItem: false)
                .frame(width: 130)
            Rectangle().fill(Color.gray).frame(width: 0.5, height: 20)
            SortButton(label: "Task", isSortItem: false)
                .frame(width: 70)
        }
        .font(.footnote)
        .padding()
    }
}
