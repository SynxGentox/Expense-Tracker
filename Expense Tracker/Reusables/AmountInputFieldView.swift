//
//  AmountInputField.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct AmountInputField: View {
    let fieldLabel: String = "Amount"
    @Binding var amountInput: Double?
    
    var body: some View {
        TextField(
            fieldLabel,
            value: Binding(
                get: {amountInput ?? 0.0},
                set: {amountInput = $0.isZero ? nil : $0}),
            format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
        .amountFontStyleExt(numSize: FontT.amountF.valueF)
    }
}

#Preview {
    AmountInputField(amountInput: .constant(nil))
}
