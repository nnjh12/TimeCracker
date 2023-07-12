//
//  SortButton.swift
//  TimeCracker
//
//  Created by Gina on 7/13/23.
//

import SwiftUI

struct SortButton: View {
    var label: String
    @State var isSortItem: Bool
    @State private var isSortDscending = true
    var body: some View {
        Button {
            isSortDscending.toggle()
        } label: {
            HStack {
                Text(label)
                    .foregroundColor(isSortItem ? .black : .gray)
                    .fontWeight(isSortItem ? .regular : .light)
                Spacer()
                Image(systemName: isSortDscending ? "chevron.down" : "chevron.up")
                    .foregroundColor(.gray)
                    .opacity(isSortItem ? 1 : 0)
            }
        }

    }
}

struct SortButton_Previews: PreviewProvider {
    static var previews: some View {
        SortButton(label: "Example", isSortItem: true)
    }
}
