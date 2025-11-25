//
//  ExerciseListStore.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/25/25.
//

import Combine
import Foundation

final class ExerciseListStore<D: ExerciseListDependency>: ObservableObject {
    @Published private(set) var state: State = .init()
    let dependency: D
    
    init(dependency: D) {
        self.dependency = dependency
    }
    
    struct State {
        var exercises: [Exercise] = []
        var path: [ExerciseRoute] = []
    }
    
    enum Action {
        case initialize
        case onAppear
        case changeRoute([ExerciseRoute])
        case tabExercise
        case tabExerciseAddButton
        case delectExercise
    }
    
    enum Effect<Action> {
        case none
        case run( ((Action) async -> ()) async -> Void )
    }
    
    func send(_ action: Action) {
        let effect = reduce(state: &state, action: action)
        handler(effect)
    }
    
    private func reduce(state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .initialize:
            return .run { [weak self] send in
                guard let self else { return }
                do {
                    self.state.exercises = try await self.dependency.loadExerciseUseCase.callAsFunction()
                } catch {
                    print("\(error)")
                }
            }
        case .onAppear:
            return .none
        case .changeRoute(let path):
            state.path = path
        case .tabExercise:
            state.exercises.append(.init(id: UUID().hashValue, name: "+", part: .abs, equipment: .band))
            break
        case .tabExerciseAddButton:
            state.path.append(.exerciseAdd)
            break
        case .delectExercise:
            //  운동 삭제
            break
        }
        return .none
    }
    
    private func handler(_ effect: Effect<Action>) {
        switch effect {
        case .none:
            return
        case .run(let work):
            Task {
                await work { [weak self] action in
                    self?.send(action)
                }
            }
        }
    }
}
