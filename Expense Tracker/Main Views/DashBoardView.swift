//
//  DashBoardView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 02/04/26.
//

import SwiftUI
import SwiftData

struct DashBoardView: View {
    @Environment(ExpenseViewModel.self) private var viewModel
    @Environment(\.colorScheme) private var colorScheme
    @Binding var selectedTab: Int
    
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        ScrollView {
            ScrollViewReader { proxy in
                VStack {
                    GreetingCardView(displayName: viewModel.displayName)
                    Divider()
                    DB_CardView(
                        balance: viewModel.remainingBalance,
                        cardName: viewModel.cardName,
                        cardType: viewModel.cardType,
                        cardNumber: viewModel.cardNumber,
                        cardTypeLogo: viewModel.cardTypeLogo)
                    Divider()
                    Spacer().frame(height: 10)
                    TotalSpentView(
                        totalSpent: viewModel.totalSpent,
                        totalBudget: viewModel.totalBudget
                    )
                    Divider()
                    Spacer().frame(height: 5)
                    TransNCatView(
                        displayExpenses: Array(viewModel.displayExpenses.prefix(7)),
                        title: "Recent transactions",
                        isHistory: true,
                        showExpandButton: true,
                        scrollProxy: proxy,
                        selectedTab: $selectedTab,
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
        for: ExpensesModel.self,
        configurations: config
    )
    
    //create the repo using the fake database
    let repo = SwiftDataExpenseRepository(data: container.mainContext)
    
    //Inject it
    DashBoardView()
        .environment(ExpenseViewModel(data: repo))
}
