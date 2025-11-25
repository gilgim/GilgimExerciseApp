//
//  SaveExerciseUseCase.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/25/25.
//

struct SaveExerciseUseCase {
    let repository: ExerciseRepository

    func callAsFunction(_ exercises: [Exercise]) async throws {
        try await repository.save(exercises)
    }
}
