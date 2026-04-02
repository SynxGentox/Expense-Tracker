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
    private let dataHelper: DataHelper = DataHelper()
    var body: some Scene {
        WindowGroup {
            ViewLoader()
                .environment(dataHelper)
        }
        .modelContainer(for: ExpensesData.self)
    }
}
