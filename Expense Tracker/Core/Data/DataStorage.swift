//
//  DataStorage.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 01/04/26.
//

import SwiftUI
import Observation

@Observable
class DataStorage {
    var expensesCloud: [ExpensesData] = []
}
