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
    let expense: ExpensesData
    var body: some View {
        ZStack {
            CardBackground(
                cornerRadius: CardT.CRadNPad.radius.valueCR,
                cardWidth: CardT.CWidth.largeW.valueCW,
                cardHeight: CardT.CHeight.smallMidH.cardCH,
                color: CardT.cardColGray.valueCC)
            
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
                            Text(expense.activityTitle)
                                .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                            
                            /// - Category: Expense Category
                            HStack {
                                Text(expense.category)
                                Circle()
                                    .fill(ButtonT.BColor.ColAccent.valueBC)
                                    .frame(width: 3, height: 3)
                                Text(expense.date, format: .dateTime.day().month())
                            }
                            .secondaryFontStyleExt(fontSize: FontT.secondaryF.valueF)
                            
                        }
                        Spacer()
                        /// - Spent Amount : amout spended this Title
                        Text(expense.amount, format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                            .foregroundStyle(.green)
                    }
                }
                .padding(.horizontal,20)
        }
    }
}

#Preview {
    let dummyData = ExpensesData(
            amount: 45.99,
            note: "Burger King",
            date: .now,
            category: "Food",
            categoryIcon: "fork.knife",
            payId: "sss",
            payMethodIcon: "dog",
            activityTitle: "blah"
            // (Add activityTitle here if you added it to your SwiftData model)
        )
    RecentListRe(expense: dummyData)
}
