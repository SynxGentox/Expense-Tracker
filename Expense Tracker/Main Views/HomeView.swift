//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \ExpensesData.date, order: .reverse) private var expensesList: [ExpensesData]
    @State private var isPresented: Bool = false
    
    var body: some View {
        
        //        let plusButtonBottomPadding: CGFloat = 4
        //        let plusButtonSize: CGFloat = 40
        ZStack {
            TabView {
                Tab.init("Home", systemImage: "house.fill") {
                        PrimaryButton(buttonDisplay: "plus", infinite: false) {
                            isPresented = true
                        }
                        .sheet(isPresented: $isPresented) {
                            AddExpenseView()
                        }
                    
                }
                
                Tab.init("History",
                         systemImage: "dollarsign.arrow.trianglehead.counterclockwise.rotate.90"
                ) {
                    List(expensesList) { expense in
                        ForEach(expensesList) { expense in
                            VStack(alignment: .leading) {
                                Text(expense.note)
                                    .font(.headline)
                                Text("$\(expense.amount, specifier: "%.2f")")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    
                }
                
                Tab.init("Reports", systemImage: "list.clipboard.fill") {
                    
                }
                
                Tab.init("Account", systemImage: "person.crop.circle.fill") {
                    
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environment(DataHelper())
        .modelContainer(for: ExpensesData.self, inMemory: true)
}
