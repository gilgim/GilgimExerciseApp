//
//  ExerciseMapper.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/25/25.
//

import SwiftData

extension ExerciseEntity {
    func toDomain() -> Exercise {
        Exercise(id: id, name: name, part: part, equipment: equipment)
    }
}

extension Exercise {
    func toEntity(context: ModelContext) -> ExerciseEntity {
        ExerciseEntity(id: id, name: name, part: part, equipment: equipment)
    }
}
