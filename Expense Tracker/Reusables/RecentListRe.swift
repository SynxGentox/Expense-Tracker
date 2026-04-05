//
//  RecentListView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 02/04/26.
//

import SwiftUI
import SwiftData

struct RecentListRe: View {
    @Environment(\.colorScheme) var colScheme
    @State var isExpanded: Bool = false
    let expense: ExpensesData
    let isHistory: Bool
    var body: some View {
        
        ZStack(alignment: .top) {
            CardBackground(
                cornerRadius: CardT.CRadNPad.radius.valueCR,
                cardWidth: CardT.CWidth.largeW.valueCW,
                cardHeight: isExpanded && isHistory ? CardT.CHeight.xxLargeH.cardCH : CardT.CHeight.smallMidH.cardCH,
                color: CardT.cardColGray.valueCC)
            .onTapGesture {
                withAnimation(.bouncy(extraBounce: 0.15)) {
                    isExpanded.toggle()
                }
            }
            
            VStack {
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
                            Image(systemName: expense.categoryIcon)
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
                        
                        HStack {
                            /// - Title: Expense Title
                            VStack(alignment: .listRowSeparatorLeading, spacing: 0) {
                                Text(isHistory ? expense.activityTitle : expense.category)
                                    .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                                
                                /// - Category: Expense Category
                                if isHistory {
                                    HStack {
                                        Text(isHistory ? expense.category : "")
                                        Circle()
                                            .fill(ButtonT.BColor.ColAccent.valueBC)
                                            .frame(width: 3, height: 3)
                                        Text(expense.date, format: .dateTime.day().month())
                                    }
                                    .secondaryFontStyleExt(fontSize: FontT.secondaryF.valueF)
                                }
                            }
                            Spacer()
                            /// - Spent Amount : amout spended this Title
                            if isHistory {
                                Text(expense.amount, format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                                    .foregroundStyle(.green)
                            }
                        }
                    }
                    .padding(.horizontal,20)
                }
                .compositingGroup()
                .padding(.top, 18)
                .allowsHitTesting(false)
                if isExpanded && isHistory {
                    Divider()
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text("From")
                                .secondaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                            Spacer()
                            Image(systemName: "rectangle.fill.on.rectangle.angled.fill")
                                .buttonIconStyleExt(buttonHeight: ButtonT.BHeight.smallH.valusBH, buttonWidth: ButtonT.BWidth.smallW.valueBW, iconColor: ButtonT.BColor.ColGreen.valueBC)
                            Text(expense.payId)
                                .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                            Image(systemName: "document.on.clipboard")
                                .buttonIconStyleExt(buttonHeight: ButtonT.BHeight.smallH.valusBH, buttonWidth: ButtonT.BWidth.smallW.valueBW, iconColor: ButtonT.BColor.ColGrayStatic.valueBC)
                        }
                        
                        HStack {
                            Text("To")
                                .secondaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                            Spacer()
                            Text("Reciever")
                                .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                            Image(systemName: "document.on.clipboard")
                                .buttonIconStyleExt(buttonHeight: ButtonT.BHeight.smallH.valusBH, buttonWidth: ButtonT.BWidth.smallW.valueBW, iconColor: ButtonT.BColor.ColGrayStatic.valueBC)
                        }
                        Divider()
                            .padding(.trailing, 10)
                        HStack {
                            CardBackground(cornerRadius: CardT.CRadNPad.radius.valueCR/2,
                                           cardWidth: CardT.CWidth.largeW.valueCW,
                                           cardHeight: CardT.CHeight.smallH.cardCH,
                                           color: ButtonT.BColor.ColWhite.valueBC)
                        }
                        .padding(.trailing,10)
                        .padding(.top,18)
                        .padding(.bottom,18)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .padding(.leading,20)
                    .padding(.trailing,10)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: CardT.CHeight.xxLargeH.cardCH, alignment: .top)
    }
}

#Preview {
    let dummyData = ExpensesData(
            amount: 45.99,
            note: "Burger King",
            date: .now,
            category: "Food",
            categoryIcon: "fork.knife",
            payId: "xyz",
            payMethodIcon: "dog",
            activityTitle: "blah"
        )
    RecentListRe(expense: dummyData, isHistory: true)
}
