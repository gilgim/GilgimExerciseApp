//
//  BodyTypeListView.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/5/25.
//

import SwiftUI
import Combine

struct BodyTypeListView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                
            }
        }
    }
}

#Preview {
    BodyTypeListView()
}

struct BodyType: Hashable {
    let id = UUID()
    let partName: String
}

struct ImpBodyTypeListRepository: BodyTypeListRepository {
    func loadBodyType() async throws -> [BodyType] {
        return []
    }
}

protocol BodyTypeListRepository {
    func loadBodyType() async throws -> [BodyType]
}

final class BodyTypeListViewModel: ObservableObject {
    
}
