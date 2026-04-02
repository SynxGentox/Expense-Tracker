//
//  RecentListView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 02/04/26.
//

import SwiftUI

struct RecentListFeat: View {
    @Environment(\.colorScheme) var colScheme
    
    var body: some View {
        ZStack {
            CardBackground(
                cornerRadius: CardT.CRadNPad.radius.valueCR,
                cardWidth: CardT.CWidth.largeW.valueCW,
                cardHeight: CardT.CHeight.smallMidH.cardCH,
                color: CardT.cardColCust(colScheme).valueCC)
            
            VStack {
                HStack {
                    ZStack {
                        CardBackground(
                            cornerRadius: CardT.CRadNPad.radius.valueCR/2,
                            cardWidth: CardT.CWidth.smallW.valueCW,
                            cardHeight: CardT.CHeight.smallH.cardCH,
                            color:  ButtonT.BColor.ColSysBack.valueBC
                        )
                        
                        /// - Category Logo: Logo of this Expenditure Category
                        Image(systemName: "apple.homekit")
                            .buttonIconStyleExt(
                                buttonHeight: ButtonT.BHeight.circleH.valusBH,
                                buttonWidth: ButtonT.BWidth.circleW.valueBW,
                                iconColor: ButtonT.BColor.ColAccent.valueBC
                            )
                    }
                    .shadow(color: ShadowT.SColor.color.valueSC,
                            radius: ShadowT.shadowR.valueS,
                            x: ShadowT.shadowX.valueS,
                            y: ShadowT.shadowY.valueS)
                    .padding(.trailing)
                    
                    HStack {
                        
                        /// - Title: Expense Title
                        VStack(alignment: .listRowSeparatorLeading, spacing: 0) {
                            Text("Clubbing")
                                .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                            
                            /// - Category: Expense Category
                            Text("Entertainment")
                                .secondaryFontStyleExt(fontSize: FontT.secondaryF.valueF)
                        }
                        Spacer()
                        /// - Spent Amount : amout spended this Title
                        Text("-$6969")
                            .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                            .foregroundStyle(.green)
                    }
                }
                
            }
        }
    }
}

#Preview {
    RecentListFeat()
}
