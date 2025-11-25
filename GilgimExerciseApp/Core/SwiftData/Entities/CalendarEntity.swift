//
//  CalendarEntity.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/25/25.
//


import Foundation
import SwiftData

@Model
final class CalendarEntity {
    @Attribute(.unique) var date: Date
    var isWorkout: Bool
    var intensity: Int
    
    init(
        date: Date,
        isWorkout: Bool,
        intensity: Int
    ) {
        self.date = date
        self.isWorkout = isWorkout
        self.intensity = intensity
    }
}