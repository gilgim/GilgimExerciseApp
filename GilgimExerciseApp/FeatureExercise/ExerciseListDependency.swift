//
//  ExerciseListDependency.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/25/25.
//


protocol ExerciseListDependency {
    associatedtype R: ExerciseRepository
    var loadExerciseUseCase: LoadExerciseUseCase<R> { get }
    var deleteExerciseUseCase: DeleteExerciseUseCase<R> { get }
}

final class ExerciseListDependencyImpl<R: ExerciseRepository>: ExerciseListDependency {
    var loadExerciseUseCase: LoadExerciseUseCase<R>
    var deleteExerciseUseCase: DeleteExerciseUseCase<R>
    
    init(repo: R) {
        self.loadExerciseUseCase = .init(repository: repo)
        self.deleteExerciseUseCase = .init(repository: repo)
    }
}
