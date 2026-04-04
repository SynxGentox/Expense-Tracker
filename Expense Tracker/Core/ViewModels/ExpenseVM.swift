//
//  ExpenseVM.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 03/04/26.
//

import SwiftUI
import SwiftData
import Observation

@Observable
class ExpenseVM {
    var expenses: [ExpensesData] = []
    var errorMessage: String?
    private let data: ExpensesRepository
    
    init(data: ExpensesRepository) {
        self.data = data
        fetchData()
    }
    
    func fetchData() {
        do {
            try self.expenses = data.fetchExpenses()
            print("4. SaveTapped, amt: \(String(describing: self.expenses.count))")
        }
        catch {
            self.errorMessage = error.localizedDescription
            
        }
    }
    
    func saveData(amount: Double, date: Date, category: String, note: String, categoryIcon: String, payId: String, payMethodIcon: String, activityTitle: String) {
        do {
            try data.addExpense(expense: ExpensesData(amount: amount, note: note, date: date, category: category, categoryIcon: categoryIcon, payId: payId, payMethodIcon: payMethodIcon, activityTitle: activityTitle))
            print("2. SaveTapped, amt: \(String(describing: amount))")
        } catch {
            errorMessage = error.localizedDescription
            print(error)
        }
        fetchData()
    }
}


