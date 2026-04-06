//
//  ValuesModel.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 06/04/26.
//

import SwiftUI

struct AmountCaluclation {
    @Environment(ExpenseVM.self) private var viewModel
    @State private var totalBudget: Double = 20
    
    
    /// Calculating the total spent and balance amount
    var balanceNspent: Double {
        let totalSpent = viewModel.displayExpenses.reduce(0) { $0 + $1.amount }
        let balance = totalBudget - totalSpent
        return balance
    }
}
