//
//  Exercise.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/25/25.
//

import Foundation
import SwiftData

@Model
final class ExerciseEntity {
    @Attribute(.unique) var id: Int
    var name: String
    var part: MusclePart
    var equipment: EquipmentType

    init(
        id: Int,
        name: String,
        part: MusclePart,
        equipment: EquipmentType
    ) {
        self.id = id
        self.name = name
        self.part = part
        self.equipment = equipment
    }
}
