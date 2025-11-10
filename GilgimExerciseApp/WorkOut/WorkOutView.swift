//
//  WorkOutView.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/6/25.
//

import SwiftUI

struct WorkOutView: View {
    @State var value: Int = 0
    var body: some View {
        VStack(spacing: 0) {
            CustomCircleView(setValue: $value)
            Button("Plus") {
                value += 1
            }
        }
    }
}

struct CustomCircleView: View {
    @Binding var setValue: Int
    
    let activeColorList: [Color] = [
        Color(hex: "C7C7CC"),
        Color(hex: "#00E676"),
        Color(hex: "#1DE9B6"),
        Color(hex: "#00B0FF"),
        Color(hex: "#64DD17"),
        Color(hex: "#AEEA00")
    ]
    
    var baseCircleCount: Int {
        (setValue / 5)
    }
    
    var wholeCircleCount: Int {
        (setValue / 5) + 1
    }
    
    var circlePer: CGFloat {
        let value = CGFloat(setValue) / 5
        let fraction = value - floor(value)
        return fraction
    }
    
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 20)
            .foregroundStyle(activeColorList[baseCircleCount % 5])
            .animation(.smooth(duration: 0.2), value: baseCircleCount)
            .overlay {
                Circle()
                    .trim(from: 0, to: circlePer)
                    .stroke(
                        activeColorList[wholeCircleCount % 5],
                        style: StrokeStyle(lineWidth: 20, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 1), value: circlePer)
            }
    }
}
#Preview {
    WorkOutView()
}

