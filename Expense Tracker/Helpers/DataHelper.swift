//
//  DataHelper.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 31/03/26.
//
//
//
//import SwiftUI
//import Observation
//import SwiftData
//
//@Observable
//class DataHelper {
//    var amountValue: Double?
//    var notesValue: String?
//    var dateValue: Date = Date.now
//    var category: String?
//    var categoryIcon: String?
//    
//    func saveExpense(to context: ModelContext) {
//        guard let newAmt = amountValue, newAmt > 0 else {
//            print("Invalid Input!: amount cant be 0")
//            return
//        }
//        
//        let newExpense = ExpensesData(
//            amount: newAmt,
//            note: notesValue ?? "",
//            date: dateValue,
//            category: category ?? "None",
//            categoryIcon: categoryIcon ?? "questionmark.circle.fill"
//        )
//        
//        context.insert(newExpense)
//        print("Expense Saved")
//    }
//    
//    func reset() {
//        amountValue = nil
//        notesValue = nil
//        dateValue = Date.now
//        category = nil
//        categoryIcon = nil
//    }
//}

