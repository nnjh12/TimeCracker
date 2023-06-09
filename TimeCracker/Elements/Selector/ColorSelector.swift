//
//  ColorSelector.swift
//  TimeCracker
//
//  Created by Gina on 6/3/23.
//

import SwiftUI

/// A view that displays app's custom color selector.
struct ColorSelector: View {
    @EnvironmentObject var appColors: AppColors
    @Binding var selectedColor: String

    var body: some View {
        HStack(spacing: 10) {
            ForEach(appColors.appColors, id: \.colorName) { colorName, color in
                Button {
                    self.selectedColor = colorName
                    print(colorName)
                } label: {
                    Circle()
                        .fill(color)
                        .frame(width: 50, height: 50)
                        // The border will be displayed in the selectes color.
                        .overlay(
                            Circle()
                                .stroke(.black, lineWidth: colorName == selectedColor ? 3 : 0)
                        )
                }
            }
        }
    }
}
