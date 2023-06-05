//
//  AppColors.swift
//  TimeCracker
//
//  Created by Gina on 6/4/23.
//

import Foundation
import SwiftUI

class AppColors: ObservableObject {
    var appColors: [(colorName: String, color: Color)] = [("red", .red),
                                       ("orange", .orange),
                                       ("yellow", .yellow),
                                       ("green", .green),
                                       ("blue", .blue),
                                       ("purple", .purple)]
    
    func convertColorToString(color: Color) -> String {
        return appColors.filter({ $0.color == color})[0].colorName
    }
    
    func convertStringToColor(colorName: String) -> Color {
        return appColors.filter({ $0.colorName == colorName})[0].color
    }
}





