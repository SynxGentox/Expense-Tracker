//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI
import SwiftData

struct ViewLoader: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \ExpensesData.date, order: .reverse) private var expensesList: [ExpensesData]
    
    
    var body: some View {
        
        //        let plusButtonBottomPadding: CGFloat = 4
        //        let plusButtonSize: CGFloat = 40
        ZStack {
            TabView {
                Tab.init("Home", systemImage: "house.fill") {
                    DashBoardView()
                }
                Tab.init("History",
                         systemImage: "dollarsign.arrow.trianglehead.counterclockwise.rotate.90"
                ) {
                    List(expensesList) { expense in
                        VStack(alignment: .leading) {
                            Text(expense.note)
                                .font(.headline)
                            Text("$\(expense.amount, specifier: "%.2f")")
                                .secondaryFontStyleExt(
                                    fontSize: FontT.primaryF.valueF
                                )
                                .foregroundColor(.secondary)
                        }
                    }
                }
                Tab.init("Reports", systemImage: "list.clipboard.fill") {
                    
                }
                
                Tab(role: .search) {
                    
                }
            }
            
        }
    }
}

#Preview {
    ViewLoader()
        .environment(DataHelper())
        .modelContainer(for: ExpensesData.self, inMemory: true)
}
