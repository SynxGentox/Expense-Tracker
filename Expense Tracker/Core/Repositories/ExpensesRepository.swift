//
//  ExpensesRepository.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 03/04/26.
//

import Foundation
import SwiftData

protocol ExpensesRepository {
    func addExpense(expense: ExpensesModel) throws
    func fetchExpenses() throws -> [ExpensesModel]
}


