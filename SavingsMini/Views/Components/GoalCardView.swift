//
//  GoalCardView.swift
//  SavingsMini
//
//  Created by Vu Cao Nguyen on 23/9/26.
//

import SwiftUI

struct GoalCardView: View {
    let goal: SavingsGoal

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(goal.name)
                    .font(.headline)
                Spacer()
                Text("\(Int(goal.progress * 100))%")
                    .font(.subheadline.bold())
                    .foregroundStyle(Color(hex: goal.colorHex))
            }

            ProgressView(value: goal.progress)
                .tint(Color(hex: goal.colorHex))

            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Đã tiết kiệm")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text(goal.currentAmount.asVND())
                        .font(.subheadline.bold())
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 2) {
                    Text("Mục tiêu")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text(goal.targetAmount.asVND())
                        .font(.subheadline.bold())
                }
            }

            if goal.daysLeft >= 0 {
                Text("Còn \(goal.daysLeft) ngày")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            } else {
                Text("Đã quá hạn")
                    .font(.caption)
                    .foregroundStyle(.red)
            }
        }
        .padding()
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    GoalCardView(
        goal: SavingsGoal(
            name: "MacBook mới",
            targetAmount: 40_000_000,
            currentAmount: 12_000_000,
            deadline: Calendar.current.date(byAdding: .month, value: 6, to: Date())!,
            colorHex: "5E5CE6"
        )
    )
    .padding()
}
