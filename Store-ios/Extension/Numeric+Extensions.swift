//
//  Numeric+Extensions.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/3/24.
//

import Foundation

// $ + price
extension Numeric {
    var moneyString: String {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter.string(for: self) ?? "$0.00"
    }
}

