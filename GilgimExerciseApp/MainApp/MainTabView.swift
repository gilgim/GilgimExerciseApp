//
//  MainTabView.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/6/25.
//


import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }
            Tab("Routine", systemImage: "list.clipboard") {
                
            }
            Tab(role: .search) {
                NavigationStack {
                    HStack { Spacer() }
                }
                .searchable(text: .constant(""))
                .searchToolbarBehavior(.automatic)
            }
        }
    }
}

#Preview {
    MainTabView()
}
