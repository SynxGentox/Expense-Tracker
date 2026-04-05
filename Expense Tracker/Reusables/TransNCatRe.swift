//
//  TransactionStateFeat.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 05/04/26.
//

import SwiftUI

struct TransNCatRe: View {
    let expenses: [ExpensesData]
    let title: String
    let isHistory: Bool
    var body: some View {
        ScrollViewReader {_ in
            ZStack {
                Rectangle()
                    .fill(.clear)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .allowsHitTesting(false)
                VStack {
                    HStack {
                        Text(title)
                            .primaryFontStyleExt(
                                fontSize: FontT.primaryF.valueF
                            )
                            .allowsHitTesting(false)
                        Spacer()
                        if isHistory {
                            Button("View all") {
                            }
                        }
                    }
                    
                    .padding(.bottom)
                    
                    if !expenses.isEmpty {
                        ForEach(expenses) { singleExpense in
                            RecentListRe(expense: singleExpense, isHistory: isHistory)
                        }
                    }
                    Spacer()
                }
                .overlay(alignment: .center) {
                    if expenses.isEmpty && isHistory {
                        VStack {
                            ActionButton(buttonDisplay: "plus", infinite: false) {
                                
                            }
                            .opacity(0.5)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
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
    TransNCatRe(expenses: dummyData, title: "Recent", isHistory: true)
}
