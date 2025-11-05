//
//  Exercise.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/5/25.
//

import Foundation

struct Exercise: Codable, Hashable {
    let id: UUID
    let name: String
    let muscle: MuscleGroup
    let equipment: Equipment
    let isBodyweight: Bool
    
    init(name: String, muscle: MuscleGroup, equipment: Equipment, isBodyweight: Bool = false) {
        self.id = UUID()
        self.name = name
        self.muscle = muscle
        self.equipment = equipment
        self.isBodyweight = isBodyweight
    }
}
