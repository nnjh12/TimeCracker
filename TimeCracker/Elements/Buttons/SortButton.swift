//
//  SortButton.swift
//  TimeCracker
//
//  Created by Gina on 7/13/23.
//

import SwiftUI

/// A view that displays a button with sorting function.
struct SortButton: View {
    enum SortItem : String {
        case clockIn, clockOut, task
        var description : String {
            switch self {
            case .clockIn: return "Clock In"
            case .clockOut: return "Clock Out"
            case .task: return "Task"
            }
          }
    }
    
    @State var sortItem: SortItem
    @Binding var curSortItem: SortItem
    @Binding var isSortDscending: Bool

    var onClick: (SortItem) -> Void
    var body: some View {
        Button {
            onClick(sortItem)
        } label: {
            HStack {
                Text(sortItem.description)
                    .foregroundColor(sortItem == curSortItem ? .black : .gray)
                    .fontWeight(sortItem == curSortItem ? .regular : .light)
                Spacer()
                Image(systemName: isSortDscending ? "chevron.down" : "chevron.up")
                    .foregroundColor(.gray)
                    .opacity(sortItem == curSortItem ? 1 : 0)
            }
        }

    }
}

//struct SortButton_Previews: PreviewProvider {
//    static var previews: some View {
//        SortButton(label: "Example", isSortItem: true, onClick: {() -> Void in print("sortItem")})
//    }
//}
