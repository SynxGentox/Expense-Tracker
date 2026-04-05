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
                               cardHeight: CardT.CHeight.mediumH.cardCH,
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
                .padding(18)
                .padding(.leading, 6)
                .frame(maxWidth: CardT.CWidth.largeW.valueCW,
                        maxHeight: CardT.CHeight.mediumH.cardCH
                 )
            }
            .compositingGroup()
            Spacer().frame(width: 8)
            ZStack {
                CardBackground(cornerRadius: CardT.CRadNPad.radius.valueCR,
                               cardWidth: CardT.CWidth.largeW.valueCW,
                               cardHeight: CardT.CHeight.mediumH.cardCH,
                               color: CardT.cardColGray.valueCC)
                
                HStack {
                    VStack {
                        HStack {
                            Text("Method")
                                .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                            Spacer()
                        }
                        
                        HStack {
                            Text(payId)
                                .secondaryFontStyleExt(fontSize: FontT.secondaryF.valueF)
                            Spacer()
                            Image(systemName: payMethodIcon)
                                .buttonIconStyleExt(
                                    buttonHeight: ButtonT.BHeight.circleH.valusBH,
                                    buttonWidth: ButtonT.BWidth.circleW.valueBW,
                                    iconColor: ButtonT.BColor.ColPrimary.valueBC
                                )
                            
                        }
                        .compositingGroup()
                        Spacer()
                    }
                }
                .padding([.leading, .vertical], 18)
                .padding(.trailing, 8)
                .padding(.leading, 6)
                .frame(maxWidth: CardT.CWidth.largeW.valueCW,
                       maxHeight: CardT.CHeight.mediumH.cardCH)
                
            }
            .compositingGroup()
        }
    }
}

#Preview {
    DateMethodSubFeat(date: .constant(Date()), payId: .constant("shias"), payMethodIcon: .constant("document.on.clipboard"))
}
