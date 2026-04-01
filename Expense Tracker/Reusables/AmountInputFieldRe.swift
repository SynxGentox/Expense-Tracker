//
//  AmountInputField.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct AmountInputField: View {
    @Environment(DataHelper.self) private var dataHelper
    let fieldLabel: String = "Amount"
    
    var body: some View {
        @Bindable var amountInput = dataHelper
        @ScaledMetric var numSize: CGFloat = 60
        TextField(
            fieldLabel,
            value: Binding(
                get: {amountInput.amountValue ?? 0.0},
                set: {amountInput.amountValue = $0.isZero ? nil : $0}),
            format:
                    .currency(
                        code: Locale.current.currency?.identifier ?? "USD"
                    )
        )
        .amountFontStyleExt(numSize: numSize)
    }
}

#Preview {
    AmountInputField()
        .environment(DataHelper())
}
