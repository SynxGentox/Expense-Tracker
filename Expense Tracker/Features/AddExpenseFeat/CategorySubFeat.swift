//
//  SelectCategoryView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct CategorySubFeat: View {
    var body: some View {
        ZStack {
            CardBackground(
                cornerRadius: CardT.CRadNPad.radius.valueCR,
                cardWidth: CardT.CWidth.largeW.valueCW,
                cardHeight: CardT.CHeight.mediumH.cardCH,
                color: CardT.backCol.valueCC)
            
            VStack {
                HStack {
                    Text("Category")
                    Spacer()
                    Button("View All") {
                    }
                }
                
                HStack {
                    ZStack {
                        CardBackground(
                            cornerRadius: CardT.CRadNPad.radius.valueCR/2,
                            cardWidth: CardT.CWidth.smallW.valueCW,
                            cardHeight: CardT.CHeight.smallH.cardCH,
                            color: CardT.iconBack.valueCC
                        )
                        Image(systemName: "apple.homekit")
                            .buttonIconStyleExt(
                                buttonHeight: ButtonT.BHeight.circleH.valusBH,
                                buttonWidth: ButtonT.BWidth.circleW.valueBW)
                            
                    }
                    .shadow(color: ShadowT.SColor.color.valueSC,
                            radius: ShadowT.shadowR.valueS,
                            x: ShadowT.shadowX.valueS,
                            y: ShadowT.shadowY.valueS)
                    .padding(.trailing)
                    VStack(alignment: .leading) {
                        Text("Clubbing")
                            .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                            .offset(y: -10)
                        Text("Entertainment")
                            .secondaryFontStyleExt(fontSize: FontT.secondaryF.valueF)
                            .offset(y: -5)
                    }
                    Spacer()
//                        Text("^")
//                            .rotationEffect(Angle(degrees: 90))
                }
            }
            .padding(.horizontal, 18)
        }
    }
}

#Preview {
    CategorySubFeat()
}
