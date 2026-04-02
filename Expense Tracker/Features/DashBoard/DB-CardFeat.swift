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
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Monthly Budget")
                        .primaryFontStyleExt(
                            fontSize: FontT.primaryF.valueF
                        )
                        
                    HStack {
                        /// - Spended Abount :    add monthly spended amount
                        Text("Spent: $300")
                            .amountFontStyleExt(
                                numSize: FontT.titleF.valueF
                            )
                            
                        /// - Monthly Budget:    add monthly budget amount
                        Text("/ $1000")
                            .secondaryFontStyleExt(
                                fontSize: FontT.primaryF.valueF
                            )
                        Spacer()
                    }
                    .compositingGroup()
                }
                ProgressView(value: 33, total: 100)
                
                Text("You Saved:    $69")
                    .amountFontStyleExt(numSize: FontT.primaryF.valueF)
                Text("(per month)")
                    .secondaryFontStyleExt(
                        fontSize: FontT.primaryF.valueF
                    )
            }
            .padding(.horizontal, 16)
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
