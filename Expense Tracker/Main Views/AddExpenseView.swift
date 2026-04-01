//
//  AddPageView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct AddExpenseView: View {
    @FocusState var isEditing: Bool
    @Environment(DataHelper.self) private var dataHelper
    @Environment(DataStorage.self) private var dataStorage
    var body: some View {
        @Bindable var amount = dataHelper
        @Bindable var text = dataHelper
        VStack(spacing: 0) {
            ScrollView {
                Spacer().frame(height: 100)
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
                dataHelper.saveExpense(to: dataStorage)
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
                    
                }
                .disabled(dataHelper.amountValue == 0.0 ? true : false)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddExpenseView()
            .environment(DataHelper())
            .environment(DataStorage())
    }
}
