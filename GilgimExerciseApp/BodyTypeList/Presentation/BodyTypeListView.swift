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
                ForEach(viewModel.state.muscleGroups, id: \.self) { muscle in
                    
                }
            }
        }
        .onAppear() {
            Task {
                await self.viewModel.send(.onAppear)
            }
        }
    }
}

#Preview {
    BodyTypeListView(viewModel: .init(repo: ImpExerciseListRepository()))
}
