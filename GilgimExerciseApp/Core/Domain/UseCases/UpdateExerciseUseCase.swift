//
//  UpdateExerciseUseCase.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/25/25.
//


struct UpdateExerciseUseCase {
    let repository: ExerciseRepository

    func callAsFunction(_ exercise: Exercise) async throws {
        try await repository.update(exercise)
    }
}
