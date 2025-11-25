//
//  MockExerciseRepo.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/25/25.
//

import Foundation

final actor MockExerciseRepo: ExerciseRepository {
    private var exercises: [Exercise] = [
        .init(id: UUID().hashValue, name: "벤치프레스", part: .chest, equipment: .barbell),
        .init(id: UUID().hashValue, name: "풀업", part: .back, equipment: .bodyweight),
    ]
    
    func save(_ exercises: [Exercise]) async throws {
        self.exercises.append(contentsOf: exercises)
    }
    
    func load() async throws -> [Exercise] {
        exercises
    }
    
    func update(_ exercise: Exercise) async throws {
        guard let idx = exercises.firstIndex(where: { $0.id == exercise.id }) else { return }
        exercises[idx] = exercise
    }
    
    func delete(_ exercise: Exercise) async throws {
        exercises.removeAll { $0.id == exercise.id }
    }
}
