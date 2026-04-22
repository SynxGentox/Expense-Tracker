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
    @State var totalBudget: Double?
    @State var displayName: String?
    @State var cardName: String?
    @State var cardNumber: String?
    @State var cardType: String?
    @State var cardTypeLogo: String?
    @FocusState var isEditing: Bool
    
    var body: some View {
        Form {
            Section("Total Budget") {
                AmountInputField(amountInput: $totalBudget)
            }
            Section("Your Details") {
                TextField("Full Name", text: Binding(
                    get: {displayName ?? ""},
                    set: {displayName = $0.isEmpty ? "Hey There" : $0}
                ))
            }
            Section("CardDetails") {
                TextField("Card Name", text: Binding(
                    get: {cardName ?? ""},
                    set: {cardName = $0.isEmpty ? "Card Name" : $0}
                ))
                
                TextField("Card Number", text: Binding(
                    get: {cardNumber ?? ""},
                    set: {cardNumber = $0.isEmpty ? "xxxx_xxxx_xxxx_xxxx" : $0}
                ))
                
                TextField("Card Type", text: Binding(
                    get: {cardType ?? ""},
                    set: {cardType = $0.isEmpty ? "no Type" : $0}
                ))
                
                TextField("Card Logo", text: Binding(
                    get: {cardTypeLogo ?? ""},
                    set: {cardTypeLogo = $0.isEmpty ? "Card Logo" : $0}
                ))
            }
        }
        .focused($isEditing)
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
                    try? await Task.sleep(nanoseconds: 1_333_000_000)
                    // This closure fires exactly when the user pulls the screen down far enough.
                    // It triggers the native iOS spinning wheel until the function completes.
                    viewModel.fetchData()
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing)
                    {
                        Button("Save") {
                            viewModel.profileData(totalBudget: totalBudget ?? 0.0, displayName: displayName ?? "", cardName: cardName ?? "", cardNumber: cardNumber ?? "", cardType: cardType ?? "", cardTypeLogo: cardTypeLogo ?? "")
                        }
                    }
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
