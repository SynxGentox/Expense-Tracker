//
//  Expense_TrackerApp.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI
import SwiftData

@main
struct Expense_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ViewLoader()
        }
        .modelContainer(for: ExpensesModel.self)
    }
}
