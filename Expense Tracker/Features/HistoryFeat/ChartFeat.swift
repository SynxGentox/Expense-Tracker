//
//  ChartFeat.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 08/04/26.
//

import SwiftUI
import Charts
import SwiftData

struct ChartFeat: View {
    @Environment(ExpenseVM.self) private var viewModel
    var body: some View {
        
        HStack {
            Text("History")
                .amountFontStyleExt(numSize: FontT.amountF.valueF)
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
        
        
        ZStack {
            CardBackground(
                cornerRadius: CardT.CRadNPad.radius.valueCR,
                cardWidth: CardT.CWidth.largeW.valueCW,
                cardHeight: CardT.CHeight.xxLargeH.cardCH - 30,
                color: CardT.cardColGray.valueCC)
            
            Chart {
                ForEach(viewModel.chartArray) { point in
                    LineMark(x: .value("Date", point.date),
                             y: .value("Amount", point.amount))
                        .interpolationMethod(.catmullRom)
                    
                    AreaMark(
                                x: .value("Date", point.date),
                                y: .value("Amount", point.amount)
                            )
                    
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
            .padding(.top, 20)
        }
        .frame(maxWidth: CardT.CWidth.largeW.valueCW, maxHeight: CardT.CHeight.xxLargeH.cardCH - 30)
        
            HStack {
                ForEach(ChartBottomButton.allCases, id: \.self) { time in
                    ActionButton(buttonDisplay: time.title, infinite: true, alignLeft: false, isSelected: viewModel.bottomButton == time) {
                        viewModel.bottomButton = time
                    }
                }
            }
            .padding(.bottom, 10)
            .disabled(viewModel.topButton != ChartTopButton.main)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(
        for: ExpensesData.self,
        configurations: config
    )
    
    //create the repo using the fake database
    let repo = SwiftDataExpenseRepository(data: container.mainContext)
    
    ChartFeat()
        .environment(ExpenseVM(data: repo))
}
