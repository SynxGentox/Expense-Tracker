//
//  DataHelper.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 31/03/26.
//


import SwiftUI
import Observation

@Observable
class DataHelper {
    var amountValue: Double?
    var notesValue: String?
    var dateValue: Date = Date.now
    var category: String?
    var categoryIcon: String?
    
    func saveExpense(to vault: DataStorage) {
        guard let newAmt = amountValue, newAmt > 0 else {
            print("Invalid Input!: amount cant be 0")
            return
        }
        
        let newExpense = ExpensesData(
            amount: newAmt,
            note: notesValue ?? "",
            date: dateValue,
            category: category ?? "None",
            categoryIcon: categoryIcon ?? "questionmark.circle.fill"
        )
        
        vault.expensesCloud.append(newExpense)
        print("Expense Saved")
    }
    
    func clearHistory(of vault: DataStorage) {
        vault.expensesCloud.removeAll()
        print("History Cleared")
    }
}

