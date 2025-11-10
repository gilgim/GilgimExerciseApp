//
//  BodyTypeListViewModel.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/5/25.
//

import SwiftUI
import Combine

struct MuscleComponent: Hashable {
    let name: String
    let imageName: String
}

@MainActor
final class BodyTypeListViewModel: ObservableObject {
    @Published private(set) var state: State = .init()
    
    private let loadMuscleGroup: LoadMuscleUseCase
    private let loadExercise: LoadExerciseUseCase
    
    init(repo: ExerciseListRepository) {
        self.loadMuscleGroup = .init(repo: repo)
        self.loadExercise = .init(repo: repo)
    }
    
    struct State {
        var muscleGroups: [MuscleComponent] = []
    }
    
    enum Action {
        case onAppear
    }
    
    func send(_ action: Action) async {
        switch action {
        case .onAppear:
            state.muscleGroups = await self.loadMuscleGroup.callAsFunction().map({ [weak self] muscle in
                guard let self else { return .init(name: "", imageName: "") }
                let name = self.displayMuscleText(muscle: muscle)
                let imageName = self.displaySymbolName(muscle: muscle)
                return MuscleComponent(name: name, imageName: imageName)
            })
        }
    }
    
    private func displayMuscleText(muscle: MuscleGroup) -> String {
        switch muscle {
        case .chest: return NSLocalizedString("Chest", comment: "")
        case .back: return NSLocalizedString("Back", comment: "")
        case .legs: return NSLocalizedString("Legs", comment: "")
        case .shoulders: return NSLocalizedString("Shoulders", comment: "")
        case .arms: return NSLocalizedString("Arms", comment: "")
        case .core: return NSLocalizedString("Core", comment: "")
        case .fullBody: return NSLocalizedString("Full Body", comment: "")
        case .other: return NSLocalizedString("Other", comment: "")
        }
    }
    
    private func displaySymbolName(muscle: MuscleGroup) -> String {
        switch muscle {
        case .chest: return "chest"
        case .back: return "back"
        case .legs: return "legs"
        case .shoulders: return "shoulders"
        case .arms: return "biceps"
        case .core: return "abs"
        case .fullBody: return "fullBody"
        case .other: return "other"
        }
    }
}
