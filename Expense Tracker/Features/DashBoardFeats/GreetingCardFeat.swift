//
//  AccountCardFeat.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 03/04/26.
//

import SwiftUI

struct GreetingCardFeat: View {
    @Environment(\.colorScheme) var colScheme
    var body: some View {
        HStack {
            VStack(alignment: .listRowSeparatorLeading) {
                /// - User Name:    A string represents the data
                Text("Aryan")
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
                
//            VStack {
//                Button{
//                    
//                } label: {
//                    Image(systemName: "bell")
//                        .buttonIconStyleExt(
//                            buttonHeight: ButtonT.BHeight.smallH.valusBH + 8,
//                            buttonWidth: ButtonT.BWidth.smallW.valueBW + 8,
//                            iconColor: ButtonT.BColor.ColPrimary.valueBC
//                        )
//                }
//                Spacer()
//            }
        }
        .frame(
            maxWidth: CardT.CWidth.largeW.valueCW,
            maxHeight: CardT.CHeight.smallMidH.cardCH
        )
    }
}

#Preview {
    GreetingCardFeat()
}


//Image(systemName: "gear")
//                    .buttonIconStyleExt(
//                        buttonHeight: ButtonT.BHeight.circleH.valusBH - 5,
//                        buttonWidth: ButtonT.BWidth.circleW.valueBW - 5,
//                        iconColor: ButtonT.BColor.ColPrimary.valueBC
//                    )
