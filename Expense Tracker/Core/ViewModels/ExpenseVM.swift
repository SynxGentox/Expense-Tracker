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
    
    /// - Parameters: expenses, errorMessage, data
    ///  - expenses: Holds the array of the expenses
    ///  - errorMessage: Holds the error thrown form the function bombing
    ///  - data: private property that conforms to the protocol
    var expenses: [ExpensesData] = []
    var errorMessage: String?
    private let data: ExpensesRepository
    
    /// - Initializer:
    ///  - initialises the data property to itself i.e. to the protocol
    ///  - Initializer executes the fetchData funciton immdeiately on creation
    init(data: ExpensesRepository) {
        self.data = data
        fetchData()
    }
    
    /// - fetchData function: a function to fetch the data form the databse to the UI,  contians do  and  catch block
    ///  - do block
    ///   - tries to iInitialise the expenses property with the data fetched from the database through the exectution of fetchExpenses called by data property
    ///  - catch block
    ///   - initialises the errorMessage property with the error thrown by the failure of the trial to fetch and initialises the data from database
    func fetchData() {
        do {
            try self.expenses = data.fetchExpenses()
            print("4. SaveTapped, amt: \(String(describing: self.expenses.count))")
        }
        catch {
            self.errorMessage = error.localizedDescription
        }
    }
    
    /// - saveData function: a function to save the data from the user to the database, contains do, catch block and several properties that will be sent to the database,  input form the user
    ///  - do block
    ///   - tries to add the expense to database by creating an Object of the database which holds the data sent by the user and using it inside addExpense function as prorperty called by the data property
    ///  - catch block
    ///   - initialises the errorMessage property with the the error thrown by the failure of the trial to addExpense and initialises the data from database
    ///  - calling the fetchData function to fetch the data for the UI
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


