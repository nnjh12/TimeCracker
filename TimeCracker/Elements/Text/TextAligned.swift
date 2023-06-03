//
//  TextLeftAligned.swift
//  TimeCracker
//
//  Created by Gina on 6/3/23.
//

import SwiftUI

struct TextLeftAligned: View {
    var text: String
    var body: some View {
        HStack{
            Text(text)
            Spacer()
        }
    }
}

struct TextRightAligned: View {
    var text: String
    var body: some View {
        HStack{
            Spacer()
            Text(text)
        }
    }
}

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
