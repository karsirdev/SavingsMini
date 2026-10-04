//
//  GoalsListView.swift
//  SavingsMini
//
//  Created by Vu Cao Nguyen on 23/9/26.
//

import SwiftUI

struct GoalsListView: View {
    @Environment(SavingsStore.self) private var store
    @State private var isShowingAddGoal = false

    var body: some View {
        NavigationStack {
            Group {
                if store.goals.isEmpty {
                    ContentUnavailableView(
                        "Chưa có mục tiêu nào",
                        systemImage: "banknote",
                        description: Text("Nhấn nút + để tạo mục tiêu tiết kiệm đầu tiên")
                    )
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(store.goals) { goal in
                                NavigationLink(value: goal) {
                                    GoalCardView(goal: goal)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Ví tiết kiệm")
            .navigationDestination(for: SavingsGoal.self) { goal in
                GoalDetailView(goal: goal)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingAddGoal = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingAddGoal) {
                AddGoalView()
            }
        }
    }
}

#Preview {
    GoalsListView()
        .environment(SavingsStore())
}
