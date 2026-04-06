//
//  TotalSpentView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 03/04/26.
//

import SwiftUI

struct TotalSpentFeat: View {
    let totalSpent: Double
    let totalBudget: Double
    var body: some View {
        /// Calculating the total spent amount
        
        HStack {
            VStack(alignment: .leading) {
                Text("Total Spent")
                    .secondaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                /// - totalSpent: Total Spent 
                HStack(alignment: .lastTextBaseline) {
                    Text(totalSpent,format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .amountFontStyleExt(numSize: FontT.titleF.valueF + 5)
                        .foregroundStyle(Color(.secondaryLabel))
                    
                    //will be sent by profileView
                    Text(totalBudget, format: .currency(code: ""))
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
    TotalSpentFeat(totalSpent: 3.0, totalBudget: 200)
}
