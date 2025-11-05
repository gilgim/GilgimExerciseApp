//
//  BodyTypeListView.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/5/25.
//

import SwiftUI
import Combine

struct BodyTypeListView: View {
    @StateObject var viewModel: BodyTypeListViewModel
    var body: some View {
        ScrollView {
            LazyVStack {
                
            }
        }
    }
}

#Preview {
    BodyTypeListView(viewModel: .init(repo: ImpExerciseListRepository()))
}








final class BodyTypeListViewModel: ObservableObject {
    @Published private(set) var state: State = .init()
    
    let loadMuscleGroup: LoadMuscleUseCase
    let loadExercise: LoadExerciseUseCase
    
    init(repo: ExerciseListRepository) {
        self.loadMuscleGroup = .init(repo: repo)
        self.loadExercise = .init(repo: repo)
    }
    
    struct State {
        let muscleGroups: [MuscleGroup] = .init()
    }
    
    enum Action {
        case onAppear
    }
    
    func send(_ action: Action) async {
        
    }
}
