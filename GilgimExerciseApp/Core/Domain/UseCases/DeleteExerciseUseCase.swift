//
//  DeleteExerciseUseCase.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/25/25.
//


struct DeleteExerciseUseCase<R: ExerciseRepository> {
    let repository: R
    init(repository: R) { self.repository = repository }
    func callAsFunction(_ exercise: Exercise) async throws {
        try await repository.delete(exercise)
    }
}
