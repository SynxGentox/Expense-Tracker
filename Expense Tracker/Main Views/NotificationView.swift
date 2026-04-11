//
//  NotificationView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 05/04/26.
//

import SwiftUI
import SwiftData

struct NotificationView: View {
    @Environment(ExpenseViewModel.self) private var viewModel
    var body: some View {
            Image(systemName: "bell.badge.slash")
                .buttonIconStyleExt(buttonHeight: ButtonT.BHeight.circleH.valusBH, buttonWidth: ButtonT.BWidth.circleW.valueBW, iconColor: ButtonT.BColor.ColPrimary.valueBC, alignLeft: false)
            Text("No notifications")
                .navigationTitle("Notifications")
                .toolbarVisibility(.hidden, for: .tabBar)
                .refreshable {
                    try? await Task.sleep(nanoseconds: 3_000_000_000)
                    // This closure fires exactly when the user pulls the screen down far enough.
                    // It triggers the native iOS spinning wheel until the function completes.
                    viewModel.fetchData()
                }
        
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(
        for: ExpensesModel.self,
        configurations: config
    )
    
    //create the repo using the fake database
    let repo = SwiftDataExpenseRepository(data: container.mainContext)
    
    NotificationView()
        .environment(ExpenseViewModel(data: repo))
}
