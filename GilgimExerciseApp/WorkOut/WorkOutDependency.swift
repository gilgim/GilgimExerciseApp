//
//  WorkOutDependency.swift
//  GilgimExerciseApp
//
//  Created by gilgim on 11/24/25.
//

import Foundation
import Combine

protocol WorkOutDependency {
    var workoutTimer: AnyPublisher<Date, Never> { get }
    var setTimer: AnyPublisher<Date, Never> { get }
    var restTimer: AnyPublisher<Date, Never> { get }
}

final class RealDependency: WorkOutDependency {
    var workoutTimer: AnyPublisher<Date, Never> = Timer.publish(every: 1/30, on: .main, in: .common).autoconnect().eraseToAnyPublisher()
    var setTimer: AnyPublisher<Date, Never> = Timer.publish(every: 0.01, on: .main, in: .common).eraseToAnyPublisher()
    var restTimer: AnyPublisher<Date, Never> = Timer.publish(every: 0.01, on: .main, in: .common).eraseToAnyPublisher()
}
