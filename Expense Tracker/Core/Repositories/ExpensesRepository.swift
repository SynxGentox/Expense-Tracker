//
//  ExpensesRepository.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 03/04/26.
//

import SwiftUI
import SwiftData

protocol ExpensesRepository {
    func addExpense(expense: ExpensesData) throws
    func fetchExpenses() throws -> [ExpensesData]
}


