//
//  HomeView.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/19/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 24) {
                
                // MARK: 1️⃣ 일주일 운동 현황판
                // → 주간 운동 시간, 횟수, 칼로리 통계
                WeeklySummaryCard()
                
                // MARK: 2️⃣ 운동 유튜버 추천
                // → LazyHStack 카드 슬라이드
                SectionHeader(title: "추천 유튜버")
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(0..<5) { _ in
                            RecommendationCard(
                                title: "어깨 루틴",
                                subtitle: "근비대 집중 루틴",
                                imageName: "figure.strengthtraining.traditional"
                            )
                        }
                    }
                    .padding(.horizontal)
                }
                
                // MARK: 3️⃣ 부족한 부위 추천
                // → 운동 데이터 기반으로 자동 분석 예정
                SectionHeader(title: "부족한 부위 추천")
                VStack(spacing: 12) {
                    ForEach(["등", "하체", "가슴"], id: \.self) { part in
                        MissingPartCard(part: part)
                    }
                }
                .padding(.horizontal)
                
                // MARK: 4️⃣ 운동 사이클 보기
                // → NavigationLink로 이동
                SectionHeader(title: "운동 사이클")
                Button(action: {}) {
                    Label("이번 사이클 보기", systemImage: "arrow.forward.circle.fill")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding(.horizontal)
                
                // MARK: 5️⃣ 운동 그래프 확인하기
                // → Swift Charts 예정 (지금은 placeholder)
                SectionHeader(title: "운동 그래프")
                RoundedRectangle(cornerRadius: 16)
                    .fill(.green.opacity(0.15))
                    .frame(height: 200)
                    .overlay {
                        Text("주간 운동 그래프 (준비중)")
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .navigationTitle("Home")
    }
}

// MARK: - RoutineView
struct RoutineView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("내 루틴") {
                    Text("기존 루틴이 여기에 표시됩니다.")
                }
                Section("추천 루틴") {
                    Text("AI 추천 루틴이 여기에 표시됩니다.")
                }
            }
            .navigationTitle("Routine")
        }
    }
}

// MARK: - SearchView
struct SearchView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("최근 검색") {
                    Text("검색 기록이 없습니다.")
                }
            }
            .navigationTitle("Search")
        }
        .searchable(text: .constant(""), prompt: "운동, 부위, 루틴 검색")
        .searchToolbarBehavior(.automatic)
    }
}

// MARK: - Component: Weekly Summary Card (달력 포함)
struct WeeklySummaryCard: View {
    // 현재 주차 계산
    private var currentWeekDays: [Date] {
        let calendar = Calendar.current
        let today = Date()
        let week = calendar.dateInterval(of: .weekOfYear, for: today)!
        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: week.start) }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            // MARK: 제목
            Text("이번 주 운동 요약")
                .font(.headline)
                .padding(.horizontal)
            
            // MARK: 통계 카드
            HStack {
                SummaryItem(icon: "clock.fill", title: "운동 시간", value: "4h 20m")
                Divider().frame(height: 50)
                SummaryItem(icon: "flame.fill", title: "칼로리", value: "1,235kcal")
                Divider().frame(height: 50)
                SummaryItem(icon: "figure.strengthtraining.traditional", title: "횟수", value: "6회")
            }
            .padding()
            .background(
                LinearGradient(colors: [.blue.opacity(0.2), .cyan.opacity(0.2)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal)
            
            // MARK: 주간 달력 (월~일)
            HStack(spacing: 12) {
                ForEach(currentWeekDays, id: \.self) { day in
                    VStack(spacing: 6) {
                        Text(day, format: .dateTime.weekday(.abbreviated)) // 월, 화, 수...
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                        
                        // 예시: 수요일에 운동했다고 표시
                        let isWorkoutDay = Calendar.current.component(.weekday, from: day) == 4
                        
                        Circle()
                            .fill(isWorkoutDay ? .blue : .gray.opacity(0.2))
                            .frame(width: 32, height: 32)
                            .overlay(
                                Text("\(Calendar.current.component(.day, from: day))")
                                    .font(.caption)
                                    .foregroundStyle(isWorkoutDay ? .white : .primary)
                            )
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .padding(.bottom, 12)
        }
    }
}

// MARK: - Component: SummaryItem
struct SummaryItem: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(.blue)
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(value)
                .font(.headline)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Component: RecommendationCard
struct RecommendationCard: View {
    let title: String
    let subtitle: String
    let imageName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 80)
                .foregroundStyle(.blue)
                .frame(maxWidth: .infinity)
            Text(title)
                .font(.headline)
            Text(subtitle)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 2)
        .frame(width: 160)
    }
}

// MARK: - Component: MissingPartCard
struct MissingPartCard: View {
    let part: String
    var body: some View {
        HStack {
            Image(systemName: "figure.strengthtraining.traditional")
                .foregroundStyle(.orange)
            Text("\(part) 강화 필요")
                .font(.subheadline)
            Spacer()
        }
        .padding()
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

// MARK: - Component: Section Header
struct SectionHeader: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
