//
//  HistoryView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 03/04/26.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    
    @Environment(ExpenseViewModel.self) private var viewModel
    
    var body: some View {
        ZStack {
            ScrollView {
                ScrollViewReader { proxy in
                    VStack(spacing: 0) {
                        ChartView()
                        Divider()
                            .padding(.bottom)
                        TransNCatView(
                            displayExpenses: viewModel.displayExpenses,
                            title: "History",
                            isHistory: true,
                            showExpandButton: false,
                            scrollProxy: proxy,
                            selectedTab: .constant(1))
                            .padding(.horizontal, 8)
                    }
                }
            }
        }
        .refreshable {
            try? await Task.sleep(nanoseconds: 1_800_000_000)
            // This closure fires exactly when the user pulls the screen down far enough.
            // It triggers the native iOS spinning wheel until the function completes.
            viewModel.fetchData()
        }
        .animation(.spring(duration: 0.6, bounce: 0.3, blendDuration: 0.3), value: viewModel.topButton)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(
        for: ExpensesModel.self,
        configurations: config
    )
    
    let repo = SwiftDataExpenseRepository(data: container.mainContext)
    HistoryView()
        .environment(ExpenseViewModel(data: repo))
}
