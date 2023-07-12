//
//  SortButton.swift
//  TimeCracker
//
//  Created by Gina on 7/13/23.
//

import SwiftUI

struct SortButton: View {
    var body: some View {
        Button {
            //on click
        } label: {
            HStack {
                Text("example")
                Image(systemName: "chevron.up")
            }
        }

    }
}

struct SortButton_Previews: PreviewProvider {
    static var previews: some View {
        SortButton()
    }
}
