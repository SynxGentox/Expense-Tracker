//
//  TransactionStateFeat.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 05/04/26.
//

import SwiftUI

struct TransNCatView: View {
    let displayExpenses: [ExpensesModel]
    let title: String
    let isHistory: Bool
    let showExpandButton: Bool
    var scrollProxy: ScrollViewProxy?
    @Binding var selectedTab: Int
    
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
                    Button("View all") {
                        selectedTab = 1
                    }
                }
            }
            .padding(.horizontal, 8)
            .padding(.bottom)
                    
            if !displayExpenses.isEmpty {
                ForEach(displayExpenses) { singleExpense in
                    RecentListView(expense: singleExpense, isHistory: isHistory, scrollProxy: scrollProxy)
                }
                
            }
            Spacer()
        }
        .overlay(alignment: .center) {
            if displayExpenses.isEmpty && isHistory {
                VStack {
                    NavigationLink(value: AppRoute.addExpense) {
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
                    .opacity(0.8)
                }
            }
        }
        .frame(minHeight: displayExpenses.isEmpty ? CardT.CHeight.xxLargeH.cardCH : .zero, maxHeight: displayExpenses.isEmpty ? CardT.CHeight.xxLargeH.cardCH : .infinity)
    }
}

#Preview {
    let dummyData = Array(arrayLiteral: ExpensesModel(
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
    TransNCatView(
        displayExpenses: dummyData,
        title: "Recent",
        isHistory: true,
        showExpandButton: false, selectedTab: .constant(1)
    )
}
