//
//  LoadExerciseUseCase.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/25/25.
//


struct LoadExerciseUseCase<R: ExerciseRepository> {
    let repository: R
    init(repository: R) { self.repository = repository }
    func callAsFunction() async throws -> [Exercise]{
        return try await repository.load()
    }
}
