//
//  TotalSpentView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 03/04/26.
//

import SwiftUI

struct TotalSpentFeat: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Total Spent")
                    .secondaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                /// - Balance: Total Balance Left
                HStack(alignment: .lastTextBaseline) {
                    Text(3.00,format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .amountFontStyleExt(numSize: FontT.titleF.valueF + 5)
                        .foregroundStyle(Color(.secondaryLabel))
                    Text("/10.00")
                        .amountFontStyleExt(numSize: FontT.primaryF.valueF)
                        .foregroundStyle(Color(.secondaryLabel).opacity(0.7))
                }
            }
            Spacer()
        }
        .frame(
            maxWidth: CardT.CWidth.largeW.valueCW,
            maxHeight: CardT.CHeight.xSmallH.cardCH
        )
    }
}

#Preview {
    TotalSpentFeat()
}
