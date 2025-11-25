//
//  WorkoutEntity.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/25/25.
//


import Foundation
import SwiftData

@Model
final class WorkoutEntity {
    @Attribute(.unique) var id: Int
    var startDate: Date
    var endDate: Date
    var workoutTime: Int
    
    @Relationship(deleteRule: .cascade, inverse: \SetEntity.workout)
    var sets: [SetEntity] = []
    
    init(
        id: Int,
        startDate: Date,
        endDate: Date,
        workoutTime: Int
    ) {
        self.id = id
        self.startDate = startDate
        self.endDate = endDate
        self.workoutTime = workoutTime
    }
}
