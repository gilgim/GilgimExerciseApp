//
//  WorkOutStore.swift
//  GilgimExerciseApp
//
//  Created by gilgim on 11/24/25.
//

import Combine
import Foundation

final class WorkOutStore<D: WorkOutDependency>: ObservableObject {
    @Published private(set) var state: State = .init()
    private var workoutCancellable: AnyCancellable?
    private var setCancellable: AnyCancellable?
    private var restCancellable: AnyCancellable?
    private var dependency: D
    
    init(dependency: D) { self.dependency = dependency }
    
    struct State {
        enum Phase { case workout, set, rest }
        
        var phase: Phase = .workout
        var isStop: Bool = false
        
        var workoutTime: Int = 0
        var setTime: Int = 0
        var restTime: Int = 0
        var userSetArray: [Set] = []
    }
    
    enum Action {
        case workoutStart, workoutStop, workoutFinish, workoutTick
        case setStart, setFinish, setTick
        case restStart, restFinish, restTick
    }
    
    enum Effect<Action> {
        case none
        case send(Action)
        case run(
            (_ send: @escaping (Action) async -> Void) async -> Void
        )
    }
    
    func send(_ action: Action) {
        let effect = reduce(state: &state, action: action)
        handle(effect)
    }
    
    private func reduce(state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .workoutStart:
            state.isStop = false
            return .run { [weak self] send in
                guard let self else { return }
                self.workoutCancellable = self.dependency.workoutTimer
                    .sink { [weak self] _ in self?.send(.workoutTick) }
                await send(.setStart)
            }
            
        case .workoutStop:
            state.isStop = true
            switch state.phase {
            case .workout:
                self.workoutCancellable?.cancel()
            case .set:
                self.setCancellable?.cancel()
            case .rest:
                self.restCancellable?.cancel()
            }
            return .none
        case .workoutFinish:
            break
        case .setStart:
            state.phase = .set
            self.setCancellable = dependency.setTimer .sink(receiveValue: { [weak self] _ in
                self?.send(.setTick)
            })
            return .none
        case .setFinish:
            break
        case .restStart:
            break
        case .restFinish:
            break
        case .workoutTick:
            state.workoutTime += 1
        case .setTick:
            state.setTime += 1
        case .restTick:
            state.restTime += 1
        }
        return .none
    }
    
    private func handle(_ effect: Effect<Action>) {
        switch effect {
        case .none:
            return
            
        case .send(let action):
            send(action)
            
        case .run(let work):
            Task { [weak self] in
                await work { action in
                    await MainActor.run {
                        self?.send(action)
                    }
                }
            }
        }
    }
}

struct Set {
    let workoutKind: String
    let setNumber: Int
    let isWarmingUp: Bool
    let setTime: Int
    let restTime: Int
    let heartRate: Int
}
