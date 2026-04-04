//
//  DB-CardView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 03/04/26.
//

import SwiftUI

struct DB_CardFeat: View {
    var body: some View {
        ZStack {
            CardBackground(
                cornerRadius: CardT.CRadNPad.radius.valueCR,
                cardWidth: CardT.CWidth.largeW.valueCW,
                cardHeight: CardT.CHeight.xLargeH.cardCH,
                color: CardT.cardColGray.valueCC)
            VStack(alignment: .listRowSeparatorLeading) {
                HStack(alignment: .top) {
                    VStack(alignment: .listRowSeparatorLeading) {
                        Text("Cardholder Name")
                            .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                        Text("Debit Card")
                            .secondaryFontStyleExt(
                                fontSize: FontT.secondaryF.valueF
                            )
                    }
                    Spacer()
                    Image(systemName: "app.background.dotted")
                        .buttonIconStyleExt(
                            buttonHeight: ButtonT.BHeight.circleH.valusBH - 12,
                            buttonWidth: ButtonT.BWidth.circleW.valueBW - 12,
                            iconColor: ButtonT.BColor.ColPrimary.valueBC
                        )
                }
                .padding(.top, 5)
                Spacer()
                    .compositingGroup()
                DB_BalanceFeat()
            }
            .overlay(alignment: .leading) {
                HStack {
                    Text("9239 4203 0249 3973")
                        .primaryFontStyleExt(fontSize: FontT.titleF.valueF)
                        .foregroundStyle(ButtonT.BColor.ColAccent.valueBC)
                        .brightness(-0.1)
                }
            }
            .padding(.leading)
            .padding(.trailing, 12)
            .padding(.vertical, 8)
        }
        .frame(
            maxWidth: CardT.CWidth.largeW.valueCW,
            maxHeight: CardT.CHeight.xLargeH.cardCH
        )
    }
}

#Preview {
    DB_CardFeat()
}
