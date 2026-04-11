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
    @State private var viewModel: ExpenseViewModel?
    
    
    var body: some View {
        
        //        let plusButtonBottomPadding: CGFloat = 4
        //        let plusButtonSize: CGFloat = 40
        ZStack {
            if let viewModel {
                TabView {
                    Tab.init("", systemImage: "rectangle.3.group.fill") {
                        NavigationStack {
                            DashBoardView()
                                .toolbar {
                                            ToolbarItem(placement: .topBarTrailing) {
                                                NavigationLink(value: AppRoute.notification) {
                                                    Image(systemName: "bell")
                                                }
                                            }
                                        }
                                        .navigationDestination(for: AppRoute.self) { route in
                                            switch route {
                                            case .notification: NotificationView()
                                            case .addExpense:   AddExpenseView()
                                            case .historyView:
                                                HistoryView()
                                            }
                                        }
                        }
                    }
                    Tab.init("",systemImage: "chart.xyaxis.line") {
                        NavigationStack {
                            HistoryView()
                                .toolbar {
                                            ToolbarItem(placement: .primaryAction) {
                                                NavigationLink(value: AppRoute.addExpense) {
                                                    Image(systemName: "plus")
                                                }
                                                .buttonStyle(.borderedProminent)
                                            }
                                        }
                                        .navigationDestination(for: AppRoute.self) { route in
                                            switch route {
                                            case .notification: NotificationView()
                                            case .addExpense:   AddExpenseView()
                                            case .historyView:
                                                HistoryView()
                                            }
                                        }
                                .toolbar {
                                    ToolbarItem(placement: .topBarTrailing) {
                                        Menu {
                                            Picker("Sort",selection: Binding(
                                                get: { viewModel.selectedSort},
                                                set: {viewModel.selectedSort = $0})
                                            ) {
                                                Text("Newest First").tag(SortOptions.newestFirst)
                                                Text("Oldest First").tag(SortOptions.oldestFirst)
                                                Text("Highest Amount").tag(SortOptions.highestAmount)
                                                Text("Lowest Amount").tag(SortOptions.lowestAmount)
                                            }
                                        } label: {
                                            Image(systemName: "line.3.horizontal.decrease")
                                        }
                                    }
                                    ToolbarItem(placement: .topBarTrailing) {
                                        Menu {
                                            Picker("Filter",selection:
                                                    Binding(
                                                        get: {viewModel.selectedFilter},
                                                        set: {viewModel.selectedFilter = $0}
                                                    )
                                            ) {
                                                Text("All").tag(FilterOptions.all)
                                                ForEach(viewModel.availableCategories,id: \.self) { cat in
                                                    Text(cat).tag(FilterOptions.specific(cat))
                                                }
                                            }
                                        } label: {
                                            Image(systemName: "slider.horizontal.3")
                                        }
                                    }
                                }
                                
                                
                        }
                    }
                    Tab.init("",systemImage: "person.and.background.dotted") {
                        NavigationStack{
                            ProfileView()
                        }
                    }
                    Tab(role: .search) {
                        NavigationStack {  }
                    }
                }
                .environment(viewModel)
            } else {
                LoadingStateView()
                    .onAppear {
                        let repo = SwiftDataExpenseRepository(data: context)
                        viewModel = ExpenseViewModel(data: repo)
                    }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ViewLoader()
        .modelContainer(for: ExpensesModel.self, inMemory: true)
}
