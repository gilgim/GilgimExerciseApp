//
//  LoadExerciseUseCase.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/5/25.
//

import Foundation

struct LoadExerciseUseCase {
    let repo: ExerciseListRepository
    func callAsFunction(muscle: MuscleGroup) async -> [Exercise] {
        return await repo.loadExercise(muscle: muscle)
    }
}
