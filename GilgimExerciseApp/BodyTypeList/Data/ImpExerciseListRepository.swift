//
//  ImpExerciseListRepository.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/5/25.
//


struct ImpExerciseListRepository: ExerciseListRepository {
    func loadExercise(muscle: MuscleGroup) async -> [Exercise] {
        return [
            .init(name: "1", muscle: .arms, equipment: .barbell),
            .init(name: "2", muscle: .arms, equipment: .barbell),
            .init(name: "3", muscle: .arms, equipment: .barbell)
        ]
    }
    
    func loadMuscleGroup() async -> [MuscleGroup] {
        return MuscleGroup.allCases
    }
}