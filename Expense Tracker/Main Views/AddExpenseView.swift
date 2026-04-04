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
    @State private var payMethodIcon: String = "cash"
    @State private var activityTitle: String = "Unknown"
    
    var body: some View {
        
        VStack(spacing: 0) {
            ScrollView {
                Spacer().frame(height: CardT.CHeight.mediumH.cardCH)
                HStack {
                    Text("How much did you spend?")
                        .primaryFontStyleExt(
                            fontSize: FontT.primaryF.valueF
                        )
                    Spacer()
                }
                AmountInputField(amountInput: $amountInput)
                    .keyboardType(.numberPad)
                    .focused($isEditing)
                    .padding(.bottom)
                    
                CategorySubFeat(
                    category: $categoryInput,
                    categoryIcon: $categoryIcon,
                    activityTitle: $activityTitle
                )
                Spacer().frame(height: 0)
                    
                DateMethodSubFeat(
                    date: $dateInput,
                    payId: $payId,
                    payMethodIcon: $payMethodIcon
                )
                .padding(.vertical)
                Spacer().frame(height: 0)
                    
                NotesSubFeat(notesValue: $notesInput)
                    .focused($isEditing)
                Spacer().frame(height: 0)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                if isEditing {
                    Button {
                        isEditing = false
                    } label: {
                        Text("Done")
                    }
                    .buttonStyle(.borderedProminent)
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
                        print(
                            "1. SaveTapped, amt: \(String(describing: amountInput ?? 0.0))"
                        )
                    } label: {
                        Text("Save")
                    }.buttonStyle(.borderedProminent)
                }
            }
        }
            
        //.toolbar(.hidden, for: .tabBar)
        .padding(.horizontal, 10)
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
