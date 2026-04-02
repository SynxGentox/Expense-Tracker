//
//  AddPageView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI
import SwiftData

struct AddExpenseView: View {
    @FocusState var isEditing: Bool
    @Environment(DataHelper.self) private var dataHelper
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        @Bindable var amount = dataHelper
        @Bindable var text = dataHelper
        
        NavigationStack {
            VStack(spacing: 0) {
                ScrollView {
                    Spacer().frame(height: CardT.CHeight.xSmallH.cardCH)
                    HStack {
                        Text("How much did you spend?")
                            .primaryFontStyleExt(
                                fontSize: FontT.primaryF.valueF
                            )
                        Spacer()
                    }
                    AmountInputField()
                        .keyboardType(.numberPad)
                        .focused($isEditing)
                        .padding(.bottom)
                    
                    CategorySubFeat()
                    Spacer().frame(height: 0)
                    
                    DateMethodSubFeat()
                        .padding(.vertical)
                    Spacer().frame(height: 0)
                    
                    NotesSubFeat()
                        .focused($isEditing)
                    Spacer().frame(height: 0)
                }
                PrimaryButton(buttonDisplay: "checkmark", infinite: true) {
                    dataHelper.saveExpense(to: context)
                    dismiss()
                }
                .padding(.vertical, 22)
                .padding(.horizontal, 18)
            }
            .ignoresSafeArea()
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    if isEditing {
                        Button("Done") {
                            isEditing = false
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    else {
                        ActionButton(buttonDisplay: "xmark", infinite: false) {
                            dataHelper.reset()
                            dismiss()
                        }
                        .disabled(dataHelper.amountValue == 0.0 ? true : false)
                    }
                }
            }
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

#Preview {
    NavigationStack {
        AddExpenseView()
            .environment(DataHelper())
            .modelContainer(for: ExpensesData.self, inMemory: true)
    }
}
