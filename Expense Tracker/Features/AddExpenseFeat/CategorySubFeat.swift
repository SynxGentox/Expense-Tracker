//
//  SelectCategoryView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct CategorySubFeat: View {
    @Binding var category: String
    @Binding var categoryIcon: String
    @Binding var activityTitle: String
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                CardBackground(
                    cornerRadius: CardT.CRadNPad.radius.valueCR,
                    cardWidth: CardT.CWidth.largeW.valueCW,
                    cardHeight: CardT.CHeight.mediumH.cardCH,
                    color: CardT.cardColGray.valueCC)
                
                VStack {
                    HStack {
                        Text("Category")
                            .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                        Spacer()
                        NavigationLink("View all") {
                            CategoryView()
                        }
                    }
                    .padding(.horizontal, 6)
                    
                    HStack {
                        ZStack {
                            CardBackground(
                                cornerRadius: CardT.CRadNPad.radius.valueCR/2,
                                cardWidth: CardT.CWidth.smallW.valueCW,
                                cardHeight: CardT.CHeight.smallH.cardCH,
                                color:  ButtonT.BColor.ColSysBack.valueBC
                            )
                            Image(systemName: categoryIcon)
                                .buttonIconStyleExt(
                                    buttonHeight: ButtonT.BHeight.circleH.valusBH,
                                    buttonWidth: ButtonT.BWidth.circleW.valueBW,
                                    iconColor: ButtonT.BColor.ColGreen.valueBC
                                )
                        }
                        .shadow(color: ShadowT.SColor.color.valueSC,
                                radius: ShadowT.shadowR.valueS,
                                x: ShadowT.shadowX.valueS,
                                y: ShadowT.shadowY.valueS)
                        .padding(.trailing)
                        
                        VStack(alignment: .listRowSeparatorLeading, spacing: 0) {
                            Text(activityTitle)
                                .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                            Text(category)
                                .secondaryFontStyleExt(fontSize: FontT.secondaryF.valueF)
                        }
                        Spacer()
                        //                        Text("^")
                        //                            .rotationEffect(Angle(degrees: 90))
                    }
                    
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: CardT.CWidth.largeW.valueCW,
                   minHeight: CardT.CHeight.mediumH.cardCH,
                   maxHeight: CardT.CHeight.mediumH.cardCH,
                   alignment: .init(horizontal: .leading, vertical: .top))
        }
    }
}

#Preview {
    CategorySubFeat(category: .constant("Food"), categoryIcon: .constant("fork.knife"), activityTitle: .constant("Drinking"))
}
