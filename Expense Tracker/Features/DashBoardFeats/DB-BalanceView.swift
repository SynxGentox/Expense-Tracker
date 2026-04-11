//
//  DashBoardBalanceView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 03/04/26.
//

import SwiftUI

struct DB_BalanceView: View {
    let balance: Double
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Balance")
                    .secondaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                
                /// - Balance: Total Balance Left
                Text(balance,
                     format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                .amountFontStyleExt(numSize: FontT.amountF.valueF - 5)
            }
            Spacer()
        }
        .frame(
            maxWidth: CardT.CWidth.largeW.valueCW,
            maxHeight: CardT.CHeight.smallH.cardCH
        )
    }
}

#Preview {
    DB_BalanceView(balance: 7.0)
}
