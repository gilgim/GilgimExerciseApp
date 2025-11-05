//
//  ExerciseListRepository.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/5/25.
//


protocol ExerciseListRepository {
    func loadExercise(muscle: MuscleGroup) async -> [Exercise]
    func loadMuscleGroup() async -> [MuscleGroup]
}
