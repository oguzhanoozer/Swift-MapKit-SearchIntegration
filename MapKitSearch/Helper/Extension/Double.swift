//
//  Double+View.swift
//  MapKitSearch
//
//  Created by oguzhan on 8.01.2025.
//

import SwiftUI

extension Double{
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? ""
    }
    
    func toKilometersRounded() -> Double {
        let kilometers = self / 1000
        return (kilometers * 100).rounded() / 100
    }
    
    var toKilometers: String {
        let kilometers = self / 1000
        return String(format: "%.2f km", kilometers)
    }
}
