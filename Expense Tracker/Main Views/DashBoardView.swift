//
//  DashBoardView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 02/04/26.
//

import SwiftUI
import SwiftData

struct DashBoardView: View {
    @Environment(ExpenseVM.self) private var viewModel
    @Environment(\.colorScheme) private var colorScheme
    
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        ScrollView {
            ScrollViewReader { _ in
                VStack {
                    GreetingCardFeat()
                    Divider()
                    DB_CardFeat(balance: viewModel.remainingBalance)
                    Divider()
                    Spacer().frame(height: 10)
                    TotalSpentFeat(
                        totalSpent: viewModel.totalSpent,
                        totalBudget: viewModel.totalBudget
                    )
                    Divider()
                    Spacer().frame(height: 5)
                    TransNCatRe(
                        displayExpenses: viewModel.displayExpenses,
                        title: "Recent transactions",
                        isHistory: true,
                        showExpandButton: true
                    )
                }
            }
        }
        .refreshable {
            try? await Task.sleep(nanoseconds: 1_800_000_000)
            // This closure fires exactly when the user pulls the screen down far enough.
            // It triggers the native iOS spinning wheel until the function completes.
            viewModel.fetchData()
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    // create an inMemory database for the preview
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(
        for: ExpensesData.self,
        configurations: config
    )
    
    //create the repo using the fake database
    let repo = SwiftDataExpenseRepository(data: container.mainContext)
    
    //Inject it
    DashBoardView()
        .environment(ExpenseVM(data: repo))
}
