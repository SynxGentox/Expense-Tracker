//
//  CategoryView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 05/04/26.
//

import SwiftUI
import SwiftData

struct CategoryView: View {
    @Environment(ExpenseVM.self) private var viewModel
    var body: some View {
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ExpensesData.self, configurations: config)
    
    let repo = SwiftDataExpenseRepository(data: container.mainContext)
    
    CategoryView()
        .environment(ExpenseVM(data: repo))
}
