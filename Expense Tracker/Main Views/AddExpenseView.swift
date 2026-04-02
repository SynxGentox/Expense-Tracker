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
        VStack(spacing: 0) {
            ScrollView {
                Spacer().frame(height: CardT.CHeight.mediumH.cardCH)
                HStack {
                    Text("How much did you spend?")
                        .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                    Spacer()
                }
            
                AmountInputField()
                    .keyboardType(.numberPad)
                    .focused($isEditing)
                    .padding(.bottom, 30)
            
                CategorySubFeat()
            
                DateMethodSubFeat()
                .padding(.vertical)
            
                NotesSubFeat()
                .focused($isEditing)
                Spacer()
            }
            PrimaryButton(buttonDisplay: "checkmark", infinite: true) {
                dataHelper.saveExpense(to: context)
                dismiss()
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 10)
        }
        .ignoresSafeArea()
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar {
            if isEditing {
                Button("Done") {
                    isEditing = false
                }
                .buttonStyle(.borderedProminent)
            }
            else {
                ActionButton(buttonDisplay: "xmark", infinite: false) {
                    dismiss()
                }
                .disabled(dataHelper.amountValue == 0.0 ? true : false)
            }
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    NavigationStack {
        AddExpenseView()
            .environment(DataHelper())
            .modelContainer(for: ExpensesData.self, inMemory: true)
    }
}
