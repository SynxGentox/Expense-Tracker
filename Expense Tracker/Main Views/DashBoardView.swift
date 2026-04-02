//
//  HomeView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 02/04/26.
//

import SwiftUI
import SwiftData

struct DashBoardView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \ExpensesData.date, order: .reverse) private var expensesList: [ExpensesData]
    @Environment(DataHelper.self) private var dataHelper
    @Environment(\.colorScheme) private var colorScheme
    @State private var isPresented: Bool = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                
                Spacer().frame(height: ButtonT.BHeight.circleH.valusBH)
                
                AccountCardFeat()
                
                Spacer().frame(height: 30)
                
                DB_BalanceFeat()
                
                Spacer().frame(height: 30)
                
                DB_CardFeat()
                
                Spacer().frame(height: 40)
                
                HStack {
                    Text("Recent")
                        .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                    Spacer()
                    Text("See All")
                }
                
                ScrollView {
                    ForEach(expensesList) { expense in
                        VStack(alignment: .leading) {
                            RecentListFeat()
                        }
                    }
                }
            }
            .overlay(alignment: .bottomTrailing) {
                PrimaryButton(buttonDisplay: "plus", infinite: false) {
                    isPresented = true
                }
                .sheet(isPresented: $isPresented) {
                    AddExpenseView()
                        .environment(DataHelper())
                        .background(
                            Color(uiColor: .systemBackground)
                                .edgesIgnoringSafeArea(.all)
                        )
                }
                .padding(.bottom, CardT.CHeight.smallMidH.cardCH)
                .padding(.trailing, 8)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    PrimaryButton(buttonDisplay: "person.fill", infinite: false) {
                        
                    }
                }
            }
        }
        .ignoresSafeArea()
        .padding(.leading, 8)
    }
}

#Preview {
    DashBoardView()
        .environment(DataHelper())
        .modelContainer(for: ExpensesData.self, inMemory: true)
}
