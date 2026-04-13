//
//  ExpenseVM.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 03/04/26.
//

import Foundation
import SwiftData
import Observation
import SwiftUI

@Observable
class ExpenseViewModel {
    
    /// - Parameters: expenses, errorMessage, data
    ///  - expenses: Holds the array of the expenses
    ///  - errorMessage: Holds the error thrown form the function bombing
    ///  - data: private property that conforms to the protocol
    var expenses: [ExpensesModel] = []
    var errorMessage: String?
    private let data: ExpensesRepository
    var selectedSort: SortOptions = .newestFirst
    var selectedFilter: FilterOptions = .all
    var sensfeedback = false
    var expenseDate = Date.now
    var topButton: ChartTopButton = .main
    var bottomButton: ChartBottomButton = .sevenDays
    
    /// Pulls categories for the database
    var availableCategories: [String] {
        Array(Set(expenses.map{$0.category})).sorted()
    }
    
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
            self.expenses = try data.fetchExpenses()
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
    func saveData(
        id: UUID,
        amount: Double,
        date: Date,
        category: String,
        note: String,
        categoryIcon: String,
        payId: String,
        payMethodIcon: String,
        activityTitle: String
    ) {
        
            do {
                if amount == 0.0{
                    throw ValidationError.zeroAmount
                } else {
                    sensfeedback.toggle()
                    try data
                        .addExpense(
                            expense: ExpensesModel(
                                id: id,
                                amount: amount,
                                note: note,
                                date: date,
                                category: category,
                                categoryIcon: categoryIcon,
                                payId: payId,
                                payMethodIcon: payMethodIcon,
                                activityTitle: activityTitle
                            )
                        )
                }
            } catch {
                self.errorMessage = error.localizedDescription
            }
            fetchData()
    }
    
    func deleteExpense(_ expense: ExpensesModel) {
        do {
            try data.deleteExpense(expense: expense)
            NotificationManager.shared.cancelReminder(of: expense.id.uuidString)
        } catch {
            self.errorMessage = error.localizedDescription
        }
        fetchData()
    }
    
    var displayExpenses: [ExpensesModel] {
        /// - Parameters: result holds the raw data of expenses
        var result = expenses
        
        /// Filter the data based on users choice
        if case .specific(let categoryName) = selectedFilter {
            result = result.filter{ $0.category == categoryName }
        }
        
        /// Sort the data based on users choice
        result.sort{ lhs,rhs in
            switch selectedSort {
            case .highestAmount: return lhs.amount>rhs.amount
            case .lowestAmount: return lhs.amount<rhs.amount
            case .newestFirst: return lhs.date>rhs.date
            case .oldestFirst: return lhs.date<rhs.date
            }
        }
        return result
    }
    
    // 1. The Mutable State (You can build a View to change this later)
    
    // HardCoded Data needs to be input and saved once and permanently form Profile View
    @ObservationIgnored @AppStorage("totalBudget")  var totalBudget:  Double = 0.0
    @ObservationIgnored @AppStorage("displayName")  var displayName:  String = "Unknown"
    @ObservationIgnored @AppStorage("cardName")     var cardName:     String = "Not Set"
    @ObservationIgnored @AppStorage("cardNumber")   var cardNumber:   String = "xxxx xxxx xxxx xxxx"
    @ObservationIgnored @AppStorage("cardType")     var cardType:     String = "unknown Type"
    @ObservationIgnored @AppStorage("cardTypeLogo") var cardTypeLogo: String = "app.background.dotted"
    
    // 2. The Computed Spent (Auto-updates whenever expenses change)
    var totalSpent: Double {
        // Using the Series A shorthand we talked about
        displayExpenses.reduce(0) { $0 + $1.amount }
    }

    // 3. The Computed Balance (Auto-updates whenever budget or spent changes)
    var remainingBalance: Double {
        totalBudget - totalSpent
    }
    
    
    var chartArray: [ExpensesModel] {
        return expenses.filter{ $0.date >= Calendar.current.date(byAdding: topButton.stride, value: -bottomButton.rawValue, to: Date()) ?? .now}
            .sorted{ $0.date < $1.date }
    }
    
}


enum ValidationError: Error, LocalizedError {
    case zeroAmount
    
    var errorDescription: String? {
        switch self {
        case .zeroAmount:
            return "Please enter an amount greater than zero."
        }
    }
}

enum ChartTopButton: CaseIterable {
    case main, monthly, yearly
    
    var stride: Calendar.Component {
        switch self {
        case .main: return .day
        case .monthly: return .month
        case .yearly: return .year
        }
    }
    
    var title: String {
        switch self {
        case .main: return "Main"
        case .monthly: return "Monthly"
        case .yearly: return "Yearly"
        }
    }
}

enum ChartBottomButton: Int, CaseIterable {
    case today = 1
    case threeDays = 3
    case fiveDays = 5
    case sevenDays = 7
    
    var title: String {
        switch self {
        case .today: return "Today"
        case .threeDays: return "3 days"
        case .fiveDays: return "5 days"
        case .sevenDays: return "7 days"
            
        }
    }
}
