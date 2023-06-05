//
//  ClockInButton.swift
//  TimeCracker
//
//  Created by Gina on 6/1/23.
//

import SwiftUI

/// A view that displays a button for task that only needs clock in.
struct ClockInButton: View {
    var task: Task
    var body: some View {
        ClockInButtonUI(label: task.label, color: task.color, clockIn: task.clockIn)
    }
}

struct ClockInButtonUI: View {
    @EnvironmentObject var appColors: AppColors
    var label: String
    var color: String
    var clockIn: () -> Void // need to pass parameter?
    
    var body: some View {
        Button {
//            clockIn()
        } label: {
            Text(label)
                .frame(width: 150, height: 150)
                .font(.title2)
                .foregroundColor(.white)
                .background(appColors.convertStringToColor(colorName: color))
                .clipShape(Circle())
        }
        .simultaneousGesture(LongPressGesture().onEnded { _ in
            print("looong pressed")
        })
        .simultaneousGesture(TapGesture().onEnded({ _ in
            clockIn()
        }))
    }
}

struct ClockInButtonUI_Previews: PreviewProvider {
    static var previews: some View {
        ClockInButtonUI(label: "example", color: "red", clockIn: {() -> Void in print("clockIn")})
    }
}
