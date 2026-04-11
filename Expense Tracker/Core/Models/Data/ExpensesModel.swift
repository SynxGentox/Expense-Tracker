//
//  Expenses.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 01/04/26.
//

import Foundation
import SwiftData

@Model
class ExpensesModel: Identifiable {
    var id: UUID = UUID()
    var amount: Double
    var note: String
    var date: Date
    var category: String
    var categoryIcon: String
    var payId: String
    var payMethodIcon: String
    var activityTitle: String
    
    init(amount: Double, note: String, date: Date, category: String, categoryIcon: String, payId: String, payMethodIcon: String, activityTitle: String) {
        self.amount = amount
        self.note = note
        self.date = date
        self.category = category
        self.categoryIcon = categoryIcon
        self.payId = payId
        self.payMethodIcon = payMethodIcon
        self.activityTitle = activityTitle
        
    }
    
}


