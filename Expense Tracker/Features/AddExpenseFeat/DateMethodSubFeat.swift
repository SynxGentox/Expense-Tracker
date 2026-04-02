//
//  SelectDateView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct DateMethodSubFeat: View {
    @Environment(\.colorScheme) var colScheme
    var body: some View {
        HStack {
            ZStack {
                CardBackground(cornerRadius: CardT.CRadNPad.radius.valueCR,
                               cardWidth: CardT.CWidth.largeW.valueCW,
                               cardHeight: CardT.CHeight.smallMidH.cardCH,
                               color: CardT.cardColCust(colScheme).valueCC)
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
                        maxHeight: CardT.CHeight.smallMidH.cardCH
                 )
            }
            ZStack {
                CardBackground(cornerRadius: CardT.CRadNPad.radius.valueCR,
                               cardWidth: CardT.CWidth.largeW.valueCW,
                               cardHeight: CardT.CHeight.smallMidH.cardCH,
                               color: CardT.cardColCust(colScheme).valueCC)
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Payment Method")
                                .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                        }
                        .padding([.leading, .top], 11)
                        HStack {
                            Image(systemName: "creditcard.fill")
                                .buttonIconStyleExt(
                                    buttonHeight: ButtonT.BHeight.circleH.valusBH,
                                    buttonWidth: ButtonT.BWidth.circleW.valueBW,
                                    iconColor: ButtonT.BColor.ColPrimary.valueBC
                                )
                            Text("Visa**69")
                                .secondaryFontStyleExt(fontSize: FontT.secondaryF.valueF)
                            Spacer()
                        }
                        .compositingGroup()
                    }
                }
                .frame(maxWidth: CardT.CWidth.largeW.valueCW,
                       maxHeight: CardT.CHeight.smallMidH.cardCH
                )
                .padding(.leading, 11)
            }
        }
    }
}

#Preview {
    DateMethodSubFeat()
}
