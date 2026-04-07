//
//  AddExpenseView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI
import SwiftData

struct AddExpenseView: View {
    @FocusState var isEditing: Bool
    @Environment(ExpenseVM.self) private var viewModel
    @State private var amountInput: Double?
    @State private var notesInput: String?
    @State private var dateInput: Date = .now
    @State private var categoryInput: String = "Unknown"
    @State private var categoryIcon: String = "questionmark.square"
    @State private var payId: String = "Cash"
    @State private var payMethodIcon: String = "document.on.clipboard"
    @State private var activityTitle: String = "Unknown"
    @State private var hapticCount = 0
    
    
    var body: some View {
        VStack {
                HStack {
                    Text("How much did you spend?")
                        .primaryFontStyleExt(
                            fontSize: FontT.primaryF.valueF
                        )
                    Spacer()
                }
            Spacer().frame(height: 30)
                AmountInputField(amountInput: $amountInput)
                    .keyboardType(.numberPad)
                    .focused($isEditing)
            Spacer().frame(height: 20)
                CategoryFeat(
                    category: $categoryInput,
                    categoryIcon: $categoryIcon,
                    activityTitle: $activityTitle
                )
                Spacer().frame(height: 0)
                    
                DateMethodFeat(
                    viewModel: viewModel,
                    payId: $payId,
                    payMethodIcon: $payMethodIcon
                )
                Spacer().frame(height: 0)
                    
                NotesFeat(notesValue: $notesInput)
                    .focused($isEditing)
                Spacer().frame(height: 0)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                if isEditing {
                    Button {
                        isEditing = false
                        hapticCount += 1
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .buttonStyle(.borderedProminent)
                    .sensoryFeedback(.success, trigger: hapticCount)
                }
                else {
                    Button {
                        
                        viewModel.saveData(
                            amount: amountInput ?? 0.0,
                            date: dateInput,
                            category: categoryInput,
                            note: notesInput ?? "",
                            categoryIcon: categoryIcon,
                            payId: payId,
                            payMethodIcon: payMethodIcon,
                            activityTitle: activityTitle
                        )
                    } label: {
                        Text("Save")
                    }.buttonStyle(.borderedProminent)
                        .sensoryFeedback(.success, trigger: viewModel.sensfeedback)
                        .sensoryFeedback(.error, trigger: viewModel.errorMessage)
                }
            }
        }
        .toolbarVisibility(.hidden, for: .tabBar)
            
        //.toolbar(.hidden, for: .tabBar)
        .padding(.horizontal, 8)
        .ignoresSafeArea()
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(
        for: ExpensesData.self,
        configurations: config
    )
    
    let repo = SwiftDataExpenseRepository(data: container.mainContext)
    NavigationStack {
        AddExpenseView()
            .environment(ExpenseVM(data: repo))
    }
}
