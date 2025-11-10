//
//  extension+Color.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/10/25.
//


//
//  extension+Color.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/10/25.
//


import SwiftUI

public extension Color {
    public init(hex: String, opacity: Double = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let r, g, b: Double
        switch hexSanitized.count {
        case 6:
            r = Double((rgb & 0xFF0000) >> 16) / 255.0
            g = Double((rgb & 0x00FF00) >> 8) / 255.0
            b = Double(rgb & 0x0000FF) / 255.0
        case 8:
            r = Double((rgb & 0xFF000000) >> 24) / 255.0
            g = Double((rgb & 0x00FF0000) >> 16) / 255.0
            b = Double((rgb & 0x0000FF00) >> 8) / 255.0
        default:
            r = 1.0; g = 1.0; b = 1.0
        }

        self.init(.sRGB, red: r, green: g, blue: b, opacity: opacity)
    }
}
