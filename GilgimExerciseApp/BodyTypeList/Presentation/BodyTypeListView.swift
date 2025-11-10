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
        List {
            ForEach(viewModel.state.muscleGroups, id: \.self) { muscle in
                HStack {
                    Image(muscle.imageName)
                        .resizable()
                           .interpolation(.high)
                           .antialiased(true)
                           .renderingMode(.template)
                           .foregroundColor(.black.opacity(0.58))
                           .frame(width: 64, height: 64)
                    Text(muscle.name)
                }
            }
        }
        .modifier(LifeCycle(viewModel: viewModel))
        .modifier(Util(viewModel: viewModel))
    }
    
    //  MARK: Life Cycle
    private struct LifeCycle: ViewModifier {
        @ObservedObject var viewModel: BodyTypeListViewModel
        func body(content: Content) -> some View {
            content
                .onAppear() {
                    Task {
                        await self.viewModel.send(.onAppear)
                    }
                }
                .onDisappear() {
                    
                }
        }
    }
    
    private struct Util: ViewModifier {
        @ObservedObject var viewModel: BodyTypeListViewModel
        func body(content: Content) -> some View {
            content
                .navigationTitle("운동 목록")
                .toolbar {
                    ToolbarItem {
                        Button("adsf") {}
                    }
                }
        }
    }
}

#Preview {
    //  네비게이션 스택??? 왜??? 네비게이션 스택으로씀?
    NavigationStack {
        BodyTypeListView(viewModel: .init(repo: ImpExerciseListRepository()))
    }
}
