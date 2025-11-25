//
//  ExerciseView.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/25/25.
//

import SwiftUI

struct ExerciseListView<D: ExerciseListDependency>: View {
    @ObservedObject var store: ExerciseListStore<D>
    private var bindingPath: Binding<[ExerciseRoute]> {
        Binding(
            get: { store.state.path },
            set: { store.send(.changeRoute($0)) }
        )
    }
    
    init(store: ExerciseListStore<D>) {
        self.store = store
        self.store.send(.initialize)
    }
    
    // MARK: - 라이프 사이클 & 네비게이션
    var body: some View {
        NavigationStack(path: bindingPath) {
            listView
            .onAppear() {
                store.send(.onAppear)
            }
            .navigationDestination(for: ExerciseRoute.self) { route in
                switch route {
                case .listDetail(let exercise):
                    Text("Exercise")
                case .exerciseAdd:
                    Text("AddView")
                case .list:
                    ExerciseListView(store: store)
                }
            }
        }
    }
    
    // MARK: - ListView
    var listView: some View {
        List {
            ForEach(store.state.exercises, id:\.id) { exercise in
                Text(exercise.name)
            }
        }
        .toolbar {
            Button {
                store.send(.tabExerciseAddButton)
            } label: { Label("", systemImage: "plus") }
        }
    }
}

#Preview {
    var store = ExerciseListStore(dependency: ExerciseListDependencyImpl(repo: MockExerciseRepo()))
    ExerciseListView(store: store)
}
