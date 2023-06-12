//
//  TextLeftAligned.swift
//  TimeCracker
//
//  Created by Gina on 6/3/23.
//

import SwiftUI

/// A view that displays text aligned to the left.
struct TextLeftAligned: View {
    var text: String
    var body: some View {
        HStack{
            Text(text)
            Spacer()
        }
    }
}

/// A view that displays text aligned to the right.
struct TextRightAligned: View {
    var text: String
    var body: some View {
        HStack{
            Spacer()
            Text(text)
        }
    }
}

/// A view that displays text aligned to the center.
struct TextCenterAligned: View {
    var text: String
    var body: some View {
        HStack{
            Spacer()
            Text(text)
            Spacer()
        }
    }
}

struct TextAligned_Previews: PreviewProvider {
    static var previews: some View {
        TextLeftAligned(text: "left")
        TextRightAligned(text: "right")
        TextCenterAligned(text: "center")
    }
}
