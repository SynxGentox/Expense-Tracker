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
            ScrollView {
                VStack(spacing: 0){
                    HStack {
                        Text("History")
                            .amountFontStyleExt(numSize: FontT.amountF.valueF)
                        Spacer()
                    }
                    Spacer().frame(height: 30)
                    Divider()
                    HStack {
                        ForEach(array, id: \.self) { time in
                            ActionButton(buttonDisplay: time, infinite: true) {
                                
                            }
                        }
                    }
                    CardBackground(
                        cornerRadius: CardT.CRadNPad.radius.valueCR,
                        cardWidth: CardT.CWidth.largeW.valueCW,
                        cardHeight: CardT.CHeight.xxLargeH.cardCH - 30,
                        color: CardT.cardColGray.valueCC)
                    HStack {
                        ForEach(arraydays, id: \.self) { time in
                            ActionButton(buttonDisplay: time, infinite: true) {
                                
                            }
                        }
                    }
                    .padding(.bottom, 10)
                    Divider()
                        .padding(.bottom)
                    TransNCatRe(expenses: viewModel.expenses, title: "History", isHistory: true)
                }
            }
        }
        .padding(.horizontal, 8)
        .refreshable {
            try? await Task.sleep(nanoseconds: 1_200_000_000)
            // This closure fires exactly when the user pulls the screen down far enough.
            // It triggers the native iOS spinning wheel until the function completes.
            viewModel.fetchData()
        }
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
