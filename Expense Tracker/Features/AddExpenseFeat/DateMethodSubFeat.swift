//
//  SelectDateView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct DateMethodSubFeat: View {
    @Binding var date: Date
    @Binding var payId: String
    @Binding var payMethodIcon: String
    
    var body: some View {
        HStack {
            ZStack {
                CardBackground(cornerRadius: CardT.CRadNPad.radius.valueCR,
                               cardWidth: CardT.CWidth.largeW.valueCW,
                               cardHeight: CardT.CHeight.smallMidH.cardCH,
                               color: CardT.cardColGray.valueCC)
                VStack {
                    HStack {
                        Text("Date")
                            .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                        
                        // add a date picker with date property as default value
                        Spacer()
                    }
                    Spacer()
                }
                .padding()
                .frame(maxWidth: CardT.CWidth.largeW.valueCW,
                        maxHeight: CardT.CHeight.smallMidH.cardCH
                 )
            }
            .compositingGroup()
            Spacer().frame(width: 16)
            ZStack {
                CardBackground(cornerRadius: CardT.CRadNPad.radius.valueCR,
                               cardWidth: CardT.CWidth.largeW.valueCW,
                               cardHeight: CardT.CHeight.smallMidH.cardCH,
                               color: CardT.cardColGray.valueCC)
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Method")
                                .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                        }
                        .padding([.leading, .top], 11)
                        HStack {
                            Image(systemName: payMethodIcon)
                                .buttonIconStyleExt(
                                    buttonHeight: ButtonT.BHeight.circleH.valusBH,
                                    buttonWidth: ButtonT.BWidth.circleW.valueBW,
                                    iconColor: ButtonT.BColor.ColPrimary.valueBC
                                )
                            Text(payId)
                                .secondaryFontStyleExt(fontSize: FontT.secondaryF.valueF)
                            Spacer()
                        }
                        .compositingGroup()
                    }
                }
                .frame(maxWidth: CardT.CWidth.largeW.valueCW,
                       maxHeight: CardT.CHeight.smallMidH.cardCH
                )
                .padding(.leading, 7)
            }
            .compositingGroup()
        }
    }
}

#Preview {
    DateMethodSubFeat(date: .constant(Date()), payId: .constant(""), payMethodIcon: .constant(""))
}
