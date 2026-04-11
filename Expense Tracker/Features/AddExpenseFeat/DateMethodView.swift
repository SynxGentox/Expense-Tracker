//
//  SelectDateView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI
import SwiftData

struct DateMethodView: View {
    @Bindable var viewModel: ExpenseViewModel
    @Binding var payId: String
    @Binding var payMethodIcon: String
    
    var body: some View {
        HStack {
            ZStack {
                CardBackground(cornerRadius: CardT.CRadNPad.radius.valueCR,
                               cardWidth: CardT.CWidth.largeW.valueCW,
                               cardHeight: CardT.CHeight.mediumH.cardCH,
                               color: CardT.cardColGray.valueCC)
                VStack {
                    HStack {
                        Text("Date")
                            .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                            .padding(.leading, 6)
                        Spacer()
                    }
                    DatePicker("Date", selection: $viewModel.expenseDate, in: ...Date.now, displayedComponents: .date)
                        .padding(.trailing)
                        .padding(.top, 10)
                    .datePickerStyle(.compact)
                    .labelsHidden()
                    
                    // add a date picker with date property as default value
                    Spacer()
                }
                .padding(18)
                .frame(maxWidth: CardT.CWidth.largeW.valueCW,
                        maxHeight: CardT.CHeight.mediumH.cardCH
                 )
            }
            .compositingGroup()
            Spacer().frame(width: 8)
            ZStack {
                CardBackground(cornerRadius: CardT.CRadNPad.radius.valueCR,
                               cardWidth: CardT.CWidth.largeW.valueCW,
                               cardHeight: CardT.CHeight.mediumH.cardCH,
                               color: CardT.cardColGray.valueCC)
                
                    VStack {
                        HStack {
                            Text("Method")
                                .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                            Spacer()
                        }
                        
                        HStack {
                            Text(payId)
                                .secondaryFontStyleExt(fontSize: FontT.secondaryF.valueF)
                            Image(systemName: payMethodIcon)
                                .buttonIconStyleExt(
                                    buttonHeight: ButtonT.BHeight.circleH.valusBH,
                                    buttonWidth: ButtonT.BWidth.circleW.valueBW,
                                    iconColor: ButtonT.BColor.ColGreen.valueBC,
                                    alignLeft: false
                                )
                            
                        }
                        .compositingGroup()
                        Spacer()
                    }
                .padding([.leading, .vertical], 18)
                .padding(.trailing, 8)
                .padding(.leading, 6)
                .frame(maxWidth: CardT.CWidth.largeW.valueCW,
                       maxHeight: CardT.CHeight.mediumH.cardCH)
                
            }
            .compositingGroup()
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(
        for: ExpensesModel.self,
        configurations: config
    )
    
    let repo = SwiftDataExpenseRepository(data: container.mainContext)
    let previewVM = ExpenseViewModel(data: repo)
    DateMethodView(
            viewModel: previewVM,
            payId: .constant("Cash"),
            payMethodIcon: .constant("rectangle.stack.fill")
        )
}
