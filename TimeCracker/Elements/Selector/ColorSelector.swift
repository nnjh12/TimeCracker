//
//  ColorSelector.swift
//  TimeCracker
//
//  Created by Gina on 6/3/23.
//

import SwiftUI

struct ColorSelector: View {
    @Binding var selectedColor: Color
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
    func convertColorToString(color: Color) -> String {
        switch color {
        case .red:
            return "red"
        case .orange:
            return "orange"
        case .yellow:
            return "yellow"
        case .green:
            return "green"
        case .blue:
            return "blue"
        case .purple:
            return "purple"
        default:
            return "not an app color"
        }
    }
    
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(colors, id: \.self) { color in
                Button {
                    self.selectedColor = color
                } label: {
                    Circle()
                        .fill(color)
                        .frame(width: 50, height: 50)
                }

            }
        }
    }
}
