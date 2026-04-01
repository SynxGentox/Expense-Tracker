//
//  Expense_TrackerApp.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

@main
struct Expense_TrackerApp: App {
    private let dataHelper: DataHelper = DataHelper()
    private let dataStorage: DataStorage = DataStorage()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(dataHelper)
                .environment(dataStorage)
        }
    }
}
