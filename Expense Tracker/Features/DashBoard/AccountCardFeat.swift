//
//  AccountCardFeat.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 03/04/26.
//

import SwiftUI

struct AccountCardFeat: View {
    @Environment(\.colorScheme) var colScheme
    var body: some View {
        VStack(alignment: .listRowSeparatorLeading) {
            Spacer()
            HStack {
                VStack(alignment: .listRowSeparatorLeading) {
                    /// - User Name:    A string represents the data
                    Text("Aryan")
                        .amountFontStyleExt(numSize: FontT.amountF.valueF - 10)
                    /// - Greeting: String represents the data
                    Text("Welcome Back!")
                        .secondaryFontStyleExt(
                            fontSize: FontT.amountF.valueF - 10
                        )
                }
                Spacer()
            }
        }
        .frame(
            maxWidth: CardT.CWidth.largeW.valueCW,
            maxHeight: CardT.CHeight.xLargeH.cardCH - CardT.CHeight.xSmallH.cardCH + 10
        )
        .overlay(alignment: .topLeading) {
            HStack {
                Image(systemName: "line.3.horizontal.decrease")
                    .buttonIconStyleExt(
                        buttonHeight: ButtonT.BHeight.circleH.valusBH - 5,
                        buttonWidth: ButtonT.BWidth.circleW.valueBW - 5,
                        iconColor: ButtonT.BColor.ColPrimary.valueBC
                    )
                Spacer()
                /// - Category Logo: Logo of this Expenditure Category
                Image(systemName: "person.circle.fill")
                    .buttonIconStyleExt(
                        buttonHeight: ButtonT.BHeight.circleH.valusBH,
                        buttonWidth: ButtonT.BWidth.circleW.valueBW,
                        iconColor: ButtonT.BColor.ColAccent.valueBC
                    )
            }
            .padding(.leading, -8)
            
        }
    }
}

#Preview {
    AccountCardFeat()
}
