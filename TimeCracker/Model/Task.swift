//
//  Task.swift
//  TimeCracker
//
//  Created by Gina on 6/1/23.
//

import Foundation
import SwiftUI

struct Task: Identifiable, Hashable {
    var id = UUID().uuidString // is it better to have firebase id?
    var label: String
    var buttonColor: Color
    var ableToClockOut: Bool
}
