//
//  SuccessStateView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 09/04/26.
//

import SwiftUI

struct SuccessStateView: View {
    @State private var currencyInput: Double?
    @Binding var result: [String : Double]
    @State var show: String = "USD"
    var body: some View {
        let sqCardSize = CardT.CHeight.mediumH.cardCH
        let rectCardSize = CardT.CWidth.largeW.valueCW
        let radius = CardT.CRadNPad.radius.valueCR
        let color = [CardT.cardColGray.valueCC, CardT.cardColAcc.valueCC]
        
        VStack {
            ForEach(color, id: \.self) { col in
                HStack{
                    ZStack {
                        CardBackground(
                            cornerRadius: radius,
                            cardWidth: rectCardSize,
                            cardHeight: sqCardSize,
                            color: col)
                        TextField("Currency Value", value: Binding(
                            get: {currencyInput ?? 0.0},
                            set: {currencyInput = $0.isZero ? nil : $0}),
                                  format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .amountFontStyleExt(numSize: FontT.amountF.valueF)
                        .padding(.leading)
                    }
                    
                    ZStack {
                        CardBackground(
                            cornerRadius: radius,
                            cardWidth: sqCardSize,
                            cardHeight: sqCardSize,
                            color: col)
                        Menu {
                            ForEach(result.sorted(by: {$0.value < $1.value}), id: \.key) { item in
                                Button {
                                    show = item.key
                                } label: {
                                    Text ("\(String(item.key))   \(String(item.value))")
                                    
                                }
                            }
                        } label: {
                            Image(systemName: "plus")
                                .amountFontStyleExt(numSize: FontT.titleF.valueF)
                                .foregroundStyle(Color.white)
                        }
                    }
                }
            }
        }
        .compositingGroup()
        .overlay{
            ActionButton(buttonDisplay: "arrow.up.arrow.down", infinite: false, alignLeft: false) {
                
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .frame(maxWidth: sqCardSize + 60, alignment: .leading)
            
        }
        
        
    }
}

#Preview {
    SuccessStateView(result: .constant(["USD":96, "hellssdo":2, "hellssdfsdo":4]))
}

