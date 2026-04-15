//
//  RecentListView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 02/04/26.
//

import SwiftUI
import SwiftData

struct RecentListView: View {
    @Environment(\.colorScheme) var colScheme
    @State var isExpanded: Bool = false
    let expense: ExpensesModel
    let isHistory: Bool
    @State private var showDeleteAlert: Bool = false
    @Environment(ExpenseViewModel.self) private var viewModel
    var scrollProxy: ScrollViewProxy?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack {
                    CardBackground(
                        cornerRadius: CardT.CRadNPad.radius.valueCR - 16,
                        cardWidth: CardT.CWidth.smallW.valueCW,
                        cardHeight: CardT.CHeight.smallH.cardCH,
                        color:  ButtonT.BColor.ColSysBack.valueBC
                    )
                            
                    /// - Category Logo: Logo of this Expenditure Category
                    Image(systemName: expense.categoryIcon)
                        .buttonIconStyleExt(
                            buttonHeight: ButtonT.BHeight.circleH.valusBH,
                            buttonWidth: ButtonT.BWidth.circleW.valueBW,
                            iconColor: ButtonT.BColor.ColGreen.valueBC, alignLeft: false
                        )
                }
                .shadow(color: ShadowT.SColor.color.valueSC,
                        radius: ShadowT.shadowR.valueS,
                        x: ShadowT.shadowX.valueS,
                        y: ShadowT.shadowY.valueS)
                .padding(.trailing)
                        
                HStack {
                    /// - Title: Expense Title
                    VStack(alignment: .listRowSeparatorLeading, spacing: 0) {
                        Text(
                            isHistory ? expense.activityTitle : expense.category
                        )
                        .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                                
                        /// - Category: Expense Category
                        if isHistory {
                            VStack(alignment: .listRowSeparatorLeading) {
                                Text(isHistory ? expense.category : "")
                                    .lineLimit(1)
                                    .truncationMode(.tail)
//                                    .frame(maxWidth: 70)
                                    
//                                Circle()
//                                    .fill(ButtonT.BColor.ColAccent.valueBC)
//                                    .frame(width: 3, height: 3)
                                Text(
                                    expense.date,
                                    format: .dateTime.day().month(.abbreviated).year(.twoDigits)
                                )
                            }
                            .secondaryFontStyleExt(
                                fontSize: FontT.secondaryF.valueF
                            )
                        }
                    }
                    Spacer()
                    /// - Spent Amount : amout spended this Title
                    if isHistory {
                        Text(
                            expense.amount,
                            format:
                                    .currency(
                                        code: Locale.current.currency?.identifier ?? "USD"
                                    )
                        )
                        .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                        .foregroundStyle(.green)
                    }
                }
            }
            
            .compositingGroup()
            .allowsHitTesting(false)
            if isExpanded && isHistory {
                Divider()
                Spacer().frame(height: 8)
                VStack(alignment: .leading, spacing: 0) {
                    VStack {
                        HStack {
                            Text("From")
                                .secondaryFontStyleExt(
                                    fontSize: FontT.primaryF.valueF
                                )
                            Spacer()
                            Image(
                                systemName: "rectangle.fill.on.rectangle.angled.fill"
                            )
                            .buttonIconStyleExt(
                                buttonHeight: ButtonT.BHeight.smallH.valusBH,
                                buttonWidth: ButtonT.BWidth.smallW.valueBW,
                                iconColor: ButtonT.BColor.ColGreen.valueBC, alignLeft: false
                            )
                            Text(expense.payId)
                                .primaryFontStyleExt(
                                    fontSize: FontT.primaryF.valueF
                                )
                            Image(systemName: "document.on.clipboard")
                                .buttonIconStyleExt(
                                    buttonHeight: ButtonT.BHeight.smallH.valusBH,
                                    buttonWidth: ButtonT.BWidth.smallW.valueBW,
                                    iconColor: ButtonT.BColor.ColGrayStatic.valueBC,
                                    alignLeft: false
                                )
                        }
                        Spacer().frame(height: 0)
                        HStack {
                            Text("To")
                                .secondaryFontStyleExt(
                                    fontSize: FontT.primaryF.valueF
                                )
                            Spacer()
                            Text("Reciever")
                                .primaryFontStyleExt(
                                    fontSize: FontT.primaryF.valueF
                                )
                            Image(systemName: "document.on.clipboard")
                                .buttonIconStyleExt(
                                    buttonHeight: ButtonT.BHeight.smallH.valusBH,
                                    buttonWidth: ButtonT.BWidth.smallW.valueBW,
                                    iconColor: ButtonT.BColor.ColGrayStatic.valueBC, alignLeft: false
                                )
                        }
                    }
                    Divider()
                    Spacer().frame(height: 0)
                        .padding(.bottom)
                    HStack(alignment: .bottom) {
                            ZStack{
                                CardBackground(cornerRadius: CardT.CRadNPad.radius.valueCR - 16,
                                               cardWidth: CardT.CWidth.largeW.valueCW,
                                               cardHeight: CardT.CHeight.smallH.cardCH,
                                               color: ButtonT.BColor.ColSysBack.valueBC)
                                Text(!expense.note.isEmpty ? expense.note : "No note available! ;)")
                                    .multilineTextAlignment(.center)
                                    .padding(8)
                                    .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                                    .foregroundStyle(Color.primary)
                            }
                            .padding(.trailing, 12)
                        Button(role: .destructive) {
                            showDeleteAlert = true
                        } label: {
                            Image(systemName: "trash")
                                .frame(maxHeight: ButtonT.BHeight.circleH.valusBH - 8)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                        
                        
                    }
                }
            }
        }
        .padding(.horizontal, 18)
        .frame(
            maxWidth: .infinity,
            minHeight: isExpanded && isHistory ? CardT.CHeight.xxLargeH.cardCH : CardT.CHeight.smallMidH.cardCH,
            maxHeight: isExpanded && isHistory ? CardT.CHeight.xxLargeH.cardCH : CardT.CHeight.smallMidH.cardCH
        )
        .background(
            RoundedRectangle(cornerRadius: CardT.CRadNPad.radius.valueCR, style: .continuous)
                .fill(CardT.cardColGray.valueCC)
        )
        .onTapGesture {
            withAnimation(.spring(duration: 0.6, bounce: 0.3, blendDuration: 0.3)) {
                isExpanded.toggle()
                if isExpanded {
                    scrollProxy?.scrollTo(expense.id, anchor: .top)
                }
            }
        }
        .alert("Delete Expense?", isPresented: $showDeleteAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Delete", role: .destructive) {
                viewModel.deleteExpense(expense)
            }
        } message: {
            Text("This can't be undone.")
        }
        .id(expense.id)
    }
}

#Preview {
    let dummyData = ExpensesModel(
        amount: 45.99,
        note: "Burger King",
        date: .now,
        category: "Food",
        categoryIcon: "fork.knife",
        payId: "xyz",
        payMethodIcon: "dog",
        activityTitle: "blah"
    )
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(
        for: ExpensesModel.self,
        configurations: config
    )
    
    let repo = SwiftDataExpenseRepository(data: container.mainContext)
    RecentListView(expense: dummyData, isHistory: true)
        .environment(ExpenseViewModel(data: repo))
}
