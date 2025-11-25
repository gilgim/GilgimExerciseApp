//
//  SetEntity.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/25/25.
//


import Foundation
import SwiftData

@Model
final class SetEntity {
    @Attribute(.unique) var id: Int
    var setTime: Int
    var restTime: Int
    var setNum: Int
    var reps: Int?
    var weight: Int?
    var heartRate: Int
    var isWarmmingUp: Bool
    
    var workout: WorkoutEntity?
    var exercise: ExerciseEntity?
    
    init(
        id: Int,
        workout: WorkoutEntity?,
        exercise: ExerciseEntity?,
        setTime: Int,
        restTime: Int,
        setNum: Int,
        reps: Int?,
        weight: Int?,
        heartRate: Int,
        isWarmmingUp: Bool
    ) {
        self.id = id
        self.workout = workout
        self.exercise = exercise
        self.setTime = setTime
        self.restTime = restTime
        self.setNum = setNum
        self.reps = reps
        self.weight = weight
        self.heartRate = heartRate
        self.isWarmmingUp = isWarmmingUp
    }
}
