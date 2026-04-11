//
//  ProfileView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 06/04/26.
//

import SwiftUI
import SwiftData

struct ProfileView: View {
    @Environment(ExpenseViewModel.self) private var viewModel
    var body: some View {
                    Text("Hello World!")
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing){
                        NavigationLink(value: "Settings") {
                            Image(systemName: "gear")
                        }
                        .navigationDestination(for: String.self) { _ in
                            SettingsView()
                        }
                    }
                }
                .refreshable {
                    try? await Task.sleep(nanoseconds: 1_800_000_000)
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
    ProfileView()
        .environment(ExpenseViewModel(data: repo))
}
