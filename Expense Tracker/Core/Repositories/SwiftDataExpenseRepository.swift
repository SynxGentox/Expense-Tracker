//
//  SwiftDataExpenseRepository.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 04/04/26.
//

import Foundation
import SwiftData

class SwiftDataExpenseRepository: ExpensesRepository {
    let data: ModelContext
    
    init(data: ModelContext) {
        self.data = data
    }
    
    func addExpense(expense: ExpensesModel) throws {
        data.insert(expense)
        try data.save()
    }
    
    func fetchExpenses() throws -> [ExpensesModel] {
        try data.fetch(FetchDescriptor<ExpensesModel>())
    }
    
    func deleteExpense(expense: ExpensesModel) throws {
        data.delete(expense)
        try data.save()
    }
}
