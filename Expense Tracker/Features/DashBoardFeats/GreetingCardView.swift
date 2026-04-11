//
//  AccountCardFeat.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 03/04/26.
//

import SwiftUI

struct GreetingCardView: View {
    @Environment(\.colorScheme) var colScheme
    let displayName: String
    var body: some View {
        HStack {
            VStack(alignment: .listRowSeparatorLeading) {
                /// - User Name:    A string represents the data
                Text(displayName)
                    .amountFontStyleExt(numSize: FontT.amountF.valueF)
                /// - Greeting: String represents the data
                Text("Welcome Back!")
                    .primaryFontStyleExt(
                        fontSize: FontT.titleF.valueF + 5
                    )
                    .foregroundStyle(.green.gradient.quaternary)
                    .brightness(-0.08)
                    Spacer()
            }
            Spacer()
        }
        .frame(
            maxWidth: CardT.CWidth.largeW.valueCW,
            maxHeight: CardT.CHeight.smallMidH.cardCH
        )
    }
}

#Preview {
    GreetingCardView(displayName: "Aryan")
}

