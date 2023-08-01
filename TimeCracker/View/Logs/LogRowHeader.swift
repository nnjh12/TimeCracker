//
//  LogRowHeader.swift
//  TimeCracker
//
//  Created by Gina on 6/8/23.
//

import SwiftUI

/// A view that displays log row's header.
struct LogRowHeader: View {
    @Binding var curSortItem: SortButton.SortItem
    @Binding var isSortDscending: Bool
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
