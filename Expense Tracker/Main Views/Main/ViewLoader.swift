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
    @State private var currencyViewModel = CurrencyViewModel(apiProtocol: CurrencyServiceRepository())
    @State private var selectedTab: Int = 0
    
    
    var body: some View {
        
        //        let plusButtonBottomPadding: CGFloat = 4
        //        let plusButtonSize: CGFloat = 40
        ZStack {
            if let viewModel {
                TabView(selection: $selectedTab) {
                    Tab.init("Dashboard", systemImage: "rectangle.3.group.fill", value: 0) {
                        NavigationStack {
                            DashBoardView(selectedTab: $selectedTab)
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
                    Tab.init("History",systemImage: "chart.xyaxis.line", value: 1) {
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
                    Tab.init("Currency", systemImage: "dollarsign.circle", value: 2) {
                        NavigationStack {
                            NetworkStateContorller(state: currencyViewModel.networkState)
                        }
                    }
                    Tab.init("Profile", systemImage: "person.and.background.dotted", value: 3) {
                        NavigationStack{
                            ProfileView()
                        }
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
