//
//  ChartModel.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 08/04/26.
//

import Foundation

struct ChartModel {
    let expenses: [ExpensesModel]
    
    var chartArray: [ExpensesModel] {
        var result = expenses
        result = result.filter{ $0.date >= Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? .now}
        return result
    }
}
