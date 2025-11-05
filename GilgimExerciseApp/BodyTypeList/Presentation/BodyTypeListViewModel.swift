//
//  BodyTypeListViewModel.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/5/25.
//

import SwiftUI
import Combine

@MainActor
final class BodyTypeListViewModel: ObservableObject {
    @Published private(set) var state: State = .init()
    
    let loadMuscleGroup: LoadMuscleUseCase
    let loadExercise: LoadExerciseUseCase
    
    init(repo: ExerciseListRepository) {
        self.loadMuscleGroup = .init(repo: repo)
        self.loadExercise = .init(repo: repo)
    }
    
    struct State {
        var muscleGroups: [MuscleGroup] = .init()
    }
    
    enum Action {
        case onAppear
    }
    
    func send(_ action: Action) async {
        switch action {
        case .onAppear:
            state.muscleGroups = await self.loadMuscleGroup.callAsFunction()
        }
    }
}
