//
//  ColorSelector.swift
//  TimeCracker
//
//  Created by Gina on 6/3/23.
//

import SwiftUI

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
                }

            }
        }
    }
}
