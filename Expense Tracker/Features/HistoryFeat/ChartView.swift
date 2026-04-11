//
//  ChartFeat.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 08/04/26.
//

import SwiftUI
import Charts
import SwiftData

struct ChartView: View {
    @Environment(ExpenseViewModel.self) private var viewModel
    var body: some View {
        
        VStack {
            HStack {
                Text("History")
                    .primaryFontStyleExt(fontSize: FontT.amountF.valueF)
                Spacer()
            }
            Spacer().frame(height: 30)
            Divider()
            HStack {
                ForEach(ChartTopButton.allCases, id: \.self) { time in
                    ActionButton(buttonDisplay: time.title, infinite: true, alignLeft: false, isSelected: viewModel.topButton == time) {
                        viewModel.topButton = time
                    }
                }
            }
            .padding(.vertical, 8)
            
            ZStack {
                CardBackground(
                    cornerRadius: CardT.CRadNPad.radius.valueCR,
                    cardWidth: CardT.CWidth.largeW.valueCW,
                    cardHeight: CardT.CHeight.xxLargeH.cardCH - 30,
                    color: CardT.cardColGray.valueCC)
                
                if !viewModel.chartArray.isEmpty {
                    Chart {
                        ForEach(viewModel.chartArray) { point in
                            LineMark(x: .value("Date", point.date),
                                     y: .value("Amount", point.amount))
                            .interpolationMethod(.stepCenter)
                        }
                    }
                    .chartXAxis{
                        AxisMarks(values: .stride(by: viewModel.topButton.stride)) { _ in
                            switch viewModel.topButton {
                            case .main:
                                AxisValueLabel(format: .dateTime.day().month())
                            case .monthly:
                                AxisValueLabel(format: .dateTime.week())
                            case .yearly:
                                AxisValueLabel(format: .dateTime.month())
                            }
                        }
                    }
                    .padding()
                    .clipped()
                }
                else {
                    VStack {
                        Image(systemName: "externaldrive.fill.badge.exclamationmark")
                            .buttonIconStyleExt(buttonHeight: ButtonT.BHeight.circleH.valusBH, buttonWidth: ButtonT.BWidth.circleW.valueBW, iconColor: .orange, alignLeft: false)
                        Text("No data!")
                            .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                    }
                }
            }
            .frame(maxWidth: CardT.CWidth.largeW.valueCW, maxHeight: CardT.CHeight.xxLargeH.cardCH - 30)
            HStack {
                ForEach(ChartBottomButton.allCases, id: \.self) { time in
                    ActionButton(buttonDisplay: time.title, infinite: true, alignLeft: false, isSelected: viewModel.bottomButton == time) {
                        viewModel.bottomButton = time
                    }
                }
            }
            .padding(.vertical, 8)
            .padding(.bottom, 10)
            .disabled(viewModel.topButton != ChartTopButton.main)
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(
        for: ExpensesModel.self,
        configurations: config
    )
    
    //create the repo using the fake database
    let repo = SwiftDataExpenseRepository(data: container.mainContext)
    
    ChartView()
        .environment(ExpenseViewModel(data: repo))
}
