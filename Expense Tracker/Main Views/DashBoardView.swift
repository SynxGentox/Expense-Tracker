//
//  DashBoardView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 02/04/26.
//

import SwiftUI
import SwiftData

struct DashBoardView: View {
    @Environment(ExpenseVM.self) private var viewModel
    @Environment(\.colorScheme) private var colorScheme
    @State private var amountInput: Double?
    @State private var notesInput: String?
    @State private var dateInput: Date = .now
    @State private var categoryInput: String = "Unknown"
    @State private var categoryIcon: String = "questionmark.square"
    @State private var activityTitle: String = "Unknown"
    
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack(alignment: .leading) {
                        
                    Spacer().frame(height: CardT.CHeight.smallH.cardCH)
                    GreetingCardFeat()
                    DB_CardFeat()
                    Spacer().frame(height: 40)
                    TotalSpentFeat()
                    Spacer().frame(height: 20)
                        
                    HStack {
                        Text("Recent Tracsactions")
                            .primaryFontStyleExt(
                                fontSize: FontT.primaryF.valueF
                            )
                        Spacer()
                        Button("View All") {
                        }
                    }
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
    // create an inMemory database for the preview
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(
        for: ExpensesData.self,
        configurations: config
    )
    
    //create the repo using the fake database
    let repo = SwiftDataExpenseRepository(data: container.mainContext)
    
    //Inject it
    DashBoardView()
        .environment(ExpenseVM(data: repo))
}
