//
//  HistoryView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 03/04/26.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    let array = ["Main", "Monthly", "Yearly"]
    let arraydays = ["Today", "3 Days", "5 Days", "7 Days"]
    @Environment(ExpenseVM.self) private var viewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0){
                ScrollView {
                    Spacer().frame(height: CardT.CHeight.smallH.cardCH)
                    HStack {
                        Text("History")
                            .amountFontStyleExt(numSize: FontT.amountF.valueF)
                        Spacer()
                    }
                    HStack {
                        ForEach(array, id: \.self) { time in
                            ActionButton(buttonDisplay: time, infinite: true) {
                                    
                            }
                        }
                    }
                    CardBackground(
                        cornerRadius: CardT.CRadNPad.radius.valueCR,
                        cardWidth: CardT.CWidth.largeW.valueCW,
                        cardHeight: CardT.CHeight.xLargeH.cardCH + 28,
                        color: CardT.cardColGray.valueCC)
                    HStack {
                        ForEach(arraydays, id: \.self) { time in
                            ActionButton(buttonDisplay: time, infinite: true) {
                                    
                            }
                        }
                    }
                    .padding(.bottom, 20)
                        
                    ForEach(viewModel.expenses) { singleExpense in
                        RecentListRe(expense: singleExpense)
                    }
                }
            }
        }
        .padding(.horizontal, 10)
        .ignoresSafeArea()
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(
        for: ExpensesData.self,
        configurations: config
    )
    
    let repo = SwiftDataExpenseRepository(data: container.mainContext)
    HistoryView()
        .environment(ExpenseVM(data: repo))
}
