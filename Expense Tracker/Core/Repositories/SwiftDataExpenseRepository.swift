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
    
    func addExpense(expense: ExpensesData) throws {
        data.insert(expense)
        try data.save()
        
        
    }
    
    func fetchExpenses() throws -> [ExpensesData] {
        try data.fetch(FetchDescriptor<ExpensesData>())
        
    }
}
