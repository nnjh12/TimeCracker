//
//  LogRowHeader.swift
//  TimeCracker
//
//  Created by Gina on 6/8/23.
//

import SwiftUI

/// A view that displays log row's header.
struct LogRowHeader: View {
    @State private var curSortItem: SortButton.SortItem = .clockOut
    @State private var isSortDscending = true
    func onClick(sortItem: SortButton.SortItem) -> Void {
        if(sortItem == curSortItem) {
            isSortDscending.toggle()
        } else {
            curSortItem = sortItem
            isSortDscending = true
        }
    }
    var body: some View {
        HStack {
            SortButton(sortItem: .clockIn, curSortItem: $curSortItem, isSortDscending: $isSortDscending, onClick: onClick)
                .frame(width: 130)
            Rectangle().fill(Color.gray).frame(width: 0.5, height: 20)
            SortButton(sortItem: .clockOut, curSortItem: $curSortItem, isSortDscending: $isSortDscending, onClick: onClick)
                .frame(width: 130)
            Rectangle().fill(Color.gray).frame(width: 0.5, height: 20)
            SortButton(sortItem: .task, curSortItem: $curSortItem, isSortDscending: $isSortDscending, onClick: onClick)
        }
        .font(.footnote)
        .padding()
    }
}
