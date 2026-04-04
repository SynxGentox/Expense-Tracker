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
                Text("Balance")
                    .secondaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                
                /// - Balance: Total Balance Left
                Text(0.00,
                     format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                .amountFontStyleExt(numSize: FontT.titleF.valueF + 10)
            }
            HStack {
                Text("+ 2.5_%")
                    .primaryFontStyleExt(
                        fontSize: FontT.primaryF.valueF
                    )
                    .foregroundStyle(Color.green)
                Spacer()
            }
            .padding(.top, 30)
        }
        .frame(
            maxWidth: CardT.CWidth.largeW.valueCW,
            maxHeight: CardT.CHeight.smallH.cardCH
        )
    }
}

#Preview {
    DB_BalanceFeat()
}
