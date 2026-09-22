//
//  Color+Hex.swift
//  SavingsMini
//
//  Created by Vu Cao Nguyen on 20/9/26.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb & 0xFF0000) >> 16) / 255
        let g = Double((rgb & 0x00FF00) >> 8) / 255
        let b = Double(rgb & 0x0000FF) / 255
        
        self.init(red: r, green: g, blue: b)
    }
}

extension Double {
    func asVND() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        formatter.maximumFractionDigits = 0
        let number = formatter.string(from: NSNumber(value: self)) ?? "0"
        return "\(number) đ"
    }
}
