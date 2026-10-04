//
//  Models.swift
//  SavingsMini
//
//  Created by Vu Cao Nguyen on 20/9/26.
//

import Foundation

struct SavingsGoal: Identifiable, Codable, Hashable {
    let id: UUID
    var name: String
    var targetAmount: Double
    var currentAmount: Double
    var deadline: Date
    var colorHex: String

    init(id: UUID = UUID(), name: String, targetAmount: Double, currentAmount: Double = 0, deadline: Date, colorHex: String = "FFC107") {
        self.id = id
        self.name = name
        self.targetAmount = targetAmount
        self.currentAmount = currentAmount
        self.deadline = deadline
        self.colorHex = colorHex
    }

    var progress: Double {
        guard targetAmount > 0 else { return 0 }
        return min(currentAmount / targetAmount, 1.0)
    }

    var remaining: Double {
        max(targetAmount - currentAmount, 0)
    }

    var daysLeft: Int {
        Calendar.current.dateComponents([.day], from: Date(), to: deadline).day ?? 0
    }
}

struct Transaction: Identifiable, Codable {
    let id: UUID
    var goalId: UUID
    var amount: Double
    var date: Date
    var note: String

    init(id: UUID = UUID(), goalId: UUID, amount: Double, date: Date = Date(), note: String = "") {
        self.id = id
        self.goalId = goalId
        self.amount = amount
        self.date = date
        self.note = note
    }
}
