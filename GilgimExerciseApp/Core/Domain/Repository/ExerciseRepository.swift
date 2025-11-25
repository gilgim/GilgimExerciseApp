//
//  ExerciseRepository.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/25/25.
//

protocol ExerciseRepository {
    func save(_ exercises: [Exercise]) async throws
    func load() async throws -> [Exercise]
    func update(_ exercise: Exercise) async throws
    func delete(_ exercise: Exercise) async throws
}
