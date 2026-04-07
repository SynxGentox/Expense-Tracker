//
//  TransactionStateFeat.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 05/04/26.
//

import SwiftUI

struct TransNCatRe: View {
    let displayExpenses: [ExpensesData]
    let title: String
    let isHistory: Bool
    let showExpandButton: Bool
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .primaryFontStyleExt(
                        fontSize: FontT.primaryF.valueF
                    )
                    .allowsHitTesting(false)
                Spacer()
                if showExpandButton {
                    NavigationLink(value: "View all"){
                        Text("View all")
                    }
                        .navigationDestination(for: String.self){_ in 
                            HistoryView()
                        }
                }
            }
                    
            .padding(.bottom)
                    
            if !displayExpenses.isEmpty {
                ForEach(displayExpenses) { singleExpense in
                    RecentListRe(expense: singleExpense, isHistory: isHistory)
                }
            }
            Spacer()
        }
        .overlay(alignment: .center) {
            if displayExpenses.isEmpty && isHistory {
                VStack {
                    NavigationLink(value: "Add expense") {
                        Image(systemName: "plus")
                            .buttonIconStyleExt(
                                buttonHeight: ButtonT.BHeight.smallH.valusBH,
                                buttonWidth: ButtonT.BWidth.smallW.valueBW,
                                iconColor: ButtonT.BColor.ColGreen.valueBC,
                                alignLeft: false
                            )
                    }
                    .navigationDestination(for: String.self) { _ in
                        AddExpenseView()
                    }
                    .opacity(0.5)
                }
            }
        }
        .frame(minHeight: displayExpenses.isEmpty ? CardT.CHeight.xxLargeH.cardCH : .zero, maxHeight: displayExpenses.isEmpty ? CardT.CHeight.xxLargeH.cardCH : .infinity)
    }
}

#Preview {
    let dummyData = Array(arrayLiteral: ExpensesData(
        amount: 45.99,
        note: "Burger King",
        date: .now,
        category: "Food",
        categoryIcon: "fork.knife",
        payId: "sss",
        payMethodIcon: "dog",
        activityTitle: "blah"
        // (Add activityTitle here if you added it to your SwiftData model)
    ))
    TransNCatRe(
        displayExpenses: dummyData,
        title: "Recent",
        isHistory: true,
        showExpandButton: false
    )
}
