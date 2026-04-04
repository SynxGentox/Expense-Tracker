//
//  ViewLoader.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI
import SwiftData

struct ViewLoader: View {
    @Environment(\.modelContext) private var context
    @State private var viewModel: ExpenseVM?
    
    
    var body: some View {
        
        //        let plusButtonBottomPadding: CGFloat = 4
        //        let plusButtonSize: CGFloat = 40
        ZStack {
            if let viewModel {
                TabView {
                    Tab.init("", systemImage: "rectangle.3.group.fill") { NavigationStack { DashBoardView() } }
                    Tab.init("",systemImage: "chart.dots.scatter") { NavigationStack { HistoryView() } }
                    Tab.init("", systemImage: "person.and.background.dotted", role: .search) { NavigationStack {   }}
                    Tab("", systemImage: "plus") { NavigationStack { AddExpenseView() } }
                }
                .environment(viewModel)
            } else {
                SkeletonLoadingView()
                .onAppear {
                    let repo = SwiftDataExpenseRepository(data: context)
                    viewModel = ExpenseVM(data: repo)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ViewLoader()
        .modelContainer(for: ExpensesData.self, inMemory: true)
}
