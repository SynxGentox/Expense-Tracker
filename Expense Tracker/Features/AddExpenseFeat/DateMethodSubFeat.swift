//
//  SelectDateView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct DateMethodSubFeat: View {
    
    var body: some View {
        HStack {
            ZStack {
                CardBackground(cornerRadius: CardT.CRadNPad.radius.valueCR,
                               cardWidth: CardT.CWidth.largeW.valueCW,
                               cardHeight: CardT.CHeight.smallMidH.cardCH,
                               color: CardT.backCol.valueCC)
                VStack {
                    HStack {
                        Text("Date")
                            .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                        Spacer()
                    }
                    Spacer()
                }
                .padding()
                .frame(maxWidth: CardT.CWidth.largeW.valueCW,
                       maxHeight: CardT.CHeight.smallMidH.cardCH)
            }
            ZStack {
                CardBackground(cornerRadius: CardT.CRadNPad.radius.valueCR,
                               cardWidth: CardT.CWidth.largeW.valueCW,
                               cardHeight: CardT.CHeight.smallMidH.cardCH,
                               color: CardT.backCol.valueCC)
                VStack {
                    HStack {
                        Text("Payment Method")
                            .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                        Spacer()
                    }
                    HStack {
                        Image(systemName: "creditcard.fill")
                            .buttonIconStyleExt(
                                buttonHeight: ButtonT.BHeight.circleH.valusBH,
                                buttonWidth: ButtonT.BWidth.circleW.valueBW)
                        Text("Visa**69")
                            .secondaryFontStyleExt(fontSize: FontT.secondaryF.valueF)
                        Spacer()
                    }
                    
                }
                .padding()
                .frame(maxWidth: CardT.CWidth.largeW.valueCW,
                       maxHeight: CardT.CHeight.smallMidH.cardCH)
            }
        }
    }
}

#Preview {
    DateMethodSubFeat()
}
