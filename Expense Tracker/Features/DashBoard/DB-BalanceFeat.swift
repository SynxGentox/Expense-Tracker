//
//  DashBoardBalanceView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 03/04/26.
//

import SwiftUI

struct DB_BalanceFeat: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Current Balance")
                    .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                
                /// - Balance: Total Balance Left
                Text(0.00, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .amountFontStyleExt(numSize: FontT.amountF.valueF)
            Spacer().frame(height: 0)
            
                HStack {
                    ZStack {
                        CardBackground(
                            cornerRadius: CardT.CRadNPad.radius.valueCR,
                            cardWidth: CardT.CWidth.xSmallW.valueCW - 5,
                            cardHeight: CardT.CHeight.xSmallH.cardCH - 5,
                            color: CardT.cardColGray.valueCC,
                        )
                        Image(systemName: "arrow.up.forward")
                            .buttonIconStyleExt(
                                buttonHeight: ButtonT.BHeight.smallH.valusBH,
                                buttonWidth: ButtonT.BWidth.smallW.valueBW,
                                iconColor: ButtonT.BColor.ColGreen.valueBC
                            )
                    }
                    .compositingGroup()
                    Text("+ 2.5%")
                        .primaryFontStyleExt(
                            fontSize: FontT.titleF.valueF
                        )
                }
            }
            Spacer()
        }
    }
}

#Preview {
    DB_BalanceFeat()
}
