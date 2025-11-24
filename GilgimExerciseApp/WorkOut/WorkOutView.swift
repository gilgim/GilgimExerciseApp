//
//  WorkOutView.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/6/25.
//

import SwiftUI

struct WorkOutView: View {
    @StateObject var store: WorkOutStore = .init(dependency: RealDependency())
    var body: some View {
        VStack(spacing: 0) {
            Text("\(store.state.workoutTime)")
            Button("start") {
                store.send(.workoutStart)
            }
        }
    }
}

#Preview {
    WorkOutView()
}

