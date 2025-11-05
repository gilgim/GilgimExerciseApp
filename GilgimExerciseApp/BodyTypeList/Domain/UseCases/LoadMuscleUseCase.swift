//
//  LoadExerciseUseCase.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/5/25.
//

import Foundation

struct LoadMuscleUseCase {
    let repo: ExerciseListRepository
    func callAsFunction(muscle: MuscleGroup) async -> [MuscleGroup] {
        return await repo.loadMuscleGroup()
    }
}
