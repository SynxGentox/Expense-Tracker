//
//  CurrencyTextField.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct InputField: View {
    var fieldLabel: String = "hello"
    
    var body: some View {
        textInput
    }
    
    @ViewBuilder
    var textInput: some View {
        ZStack {
            CardBackground(
                cornerRadius: CardT.CRadNPad.radius.valueCR,
                cardWidth: CardT.CWidth.largeW.valueCW,
                cardHeight: CardT.CHeight.smallH.cardCH,
                color: Color(UIColor.systemGray6)
            )
//            TextField(fieldLabel, text: Binding(
//                get: {textFieldInput.textNotes ?? ""},
//                set: {textFieldInput.textNotes = $0.isEmpty ? nil : $0})
//            )
                .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                .padding(.leading, CardT.CRadNPad.IconPad.valueCR)
                .frame(
                    maxWidth: CardT.CWidth.largeW.valueCW,
                    maxHeight: CardT.CHeight.smallH.cardCH
                )
        }
        .padding()
    }
}

#Preview {
    InputField()
}
