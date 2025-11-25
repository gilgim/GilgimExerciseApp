//
//  Exercise.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/25/25.
//

struct Exercise: Hashable, Codable {
    let id: Int
    let name: String
    let part: MusclePart
    let equipment: EquipmentType
}
