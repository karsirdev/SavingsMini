//
//  SavingsStore.swift
//  SavingsMini
//
//  Created by Vu Cao Nguyen on 20/9/26.
//

import Foundation
import Observation

@Observable
final class SavingsStore {
    var goals: [SavingsGoal] = []
    var transactions: [Transaction] = []

    private let goalsKey = "savings.goals"
    private let transactionsKey = "savings.transactions"

    init() {
        load()
        if goals.isEmpty {
            seedSampleData()
        }
    }

    func addGoal(name: String, targetAmount: Double, deadline: Date, colorHex: String) {
        let goal = SavingsGoal(name: name, targetAmount: targetAmount, deadline: deadline, colorHex: colorHex)
        goals.append(goal)
        save()
    }

    func deleteGoal(_ goal: SavingsGoal) {
        goals.removeAll { $0.id == goal.id }
        transactions.removeAll { $0.goalId == goal.id }
        save()
    }

    func addContribution(to goal: SavingsGoal, amount: Double, note: String = "") {
        guard let index = goals.firstIndex(where: { $0.id == goal.id }) else { return }
        goals[index].currentAmount += amount
        let tx = Transaction(goalId: goal.id, amount: amount, note: note)
        transactions.append(tx)
        save()
    }

    func transactions(for goal: SavingsGoal) -> [Transaction] {
        transactions
            .filter { $0.goalId == goal.id }
            .sorted { $0.date > $1.date }
    }

    private func save() {
        if let data = try? JSONEncoder().encode(goals) {
            UserDefaults.standard.set(data, forKey: goalsKey)
        }
        if let data = try? JSONEncoder().encode(transactions) {
            UserDefaults.standard.set(data, forKey: transactionsKey)
        }
    }

    private func load() {
        if let data = UserDefaults.standard.data(forKey: goalsKey),
           let decoded = try? JSONDecoder().decode([SavingsGoal].self, from: data) {
            goals = decoded
        }
        if let data = UserDefaults.standard.data(forKey: transactionsKey),
           let decoded = try? JSONDecoder().decode([Transaction].self, from: data) {
            transactions = decoded
        }
    }

    private func seedSampleData() {
        let laptop = SavingsGoal(name: "MacBook mới", targetAmount: 40_000_000, currentAmount: 12_000_000, deadline: Calendar.current.date(byAdding: .month, value: 6, to: Date())!, colorHex: "5E5CE6")
        let trip = SavingsGoal(name: "Du lịch Đà Lạt", targetAmount: 5_000_000, currentAmount: 3_200_000, deadline: Calendar.current.date(byAdding: .month, value: 2, to: Date())!, colorHex: "FFC107")
        goals = [laptop, trip]
    }
}
