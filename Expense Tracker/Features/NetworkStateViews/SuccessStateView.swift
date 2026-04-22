//
//  SuccessStateView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 09/04/26.
//

import SwiftUI

struct SuccessStateView: View {
    @State private var currencyInput: Double?
    @State var result: [String : Double]
    @State var inputCurr: String = Locale.current.currency?.identifier ?? "USD"
    @State var outputCurr: String = Locale.current.currency?.identifier ?? "USD"
    @FocusState private var currencyFocus: Bool
    
    var body: some View {
        let sqCardSize = CardT.CHeight.mediumH.cardCH
        let rectCardSize = CardT.CWidth.largeW.valueCW
        let radius = CardT.CRadNPad.radius.valueCR
        
        ZStack {
            CardBackground(cornerRadius: radius + 10, cardWidth: rectCardSize, cardHeight: CardT.CHeight.xxLargeH.cardCH, color: CardT.cardColGray.valueCC)
            VStack {
                HStack {
                    ZStack {
                        CardBackground(
                            cornerRadius: radius,
                            cardWidth: rectCardSize,
                            cardHeight: sqCardSize,
                            color: ButtonT.BColor.ColBlack.valueBC)
                        .shadow(color: .primary.opacity(0.1), radius: 10)
                        TextField("Currency Value",
                                  value: Binding(
                                    get: {currencyInput ?? 0.0},
                                    set: {currencyInput = $0.isZero ? nil : $0}),
                                  format:.currency(code: inputCurr))
                        .focused($currencyFocus)
                        .amountFontStyleExt(numSize: FontT.amountF.valueF)
                        .foregroundStyle(CardT.cardColAcc.valueCC)
                        .padding(.leading)
                    }
                    
                    ZStack {
                        CardBackground(
                            cornerRadius: radius,
                            cardWidth: sqCardSize,
                            cardHeight: sqCardSize,
                            color: ButtonT.BColor.ColBlack.valueBC)
                        .shadow(color: .primary.opacity(0.1), radius: 10)
                        Menu {
                            ForEach(
                                result.sorted(by: {$0.value < $1.value}),
                                id: \.key
                            ) { item in
                                Button {
                                    inputCurr = item.key
                                } label: {
                                    Text (
                                        "\(String(item.key))   \(String(item.value))"
                                    )
                                }
                            }
                        } label: {
                            Text(inputCurr)
                                .amountFontStyleExt(numSize: FontT.titleF.valueF)
                                .foregroundStyle(CardT.cardColAcc.valueCC)
                        }
                    }
                }
                Spacer().frame(height: 0)
                HStack {
                    ZStack {
                        CardBackground(
                            cornerRadius: radius,
                            cardWidth: rectCardSize,
                            cardHeight: sqCardSize,
                            color: CardT.cardColAcc.valueCC)
                        HStack {
                            let res = (currencyInput ?? 0)*((result[outputCurr] ?? 1.0) / (result[inputCurr] ?? 1.0))
                            Text(res, format:.currency(code: outputCurr))
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .amountFontStyleExt(numSize: FontT.amountF.valueF)
                        .foregroundStyle(CardT.cardColGray.valueCC)
                        .padding(.leading)
                    }
                    
                    ZStack {
                        CardBackground(
                            cornerRadius: radius,
                            cardWidth: sqCardSize,
                            cardHeight: sqCardSize,
                            color: CardT.cardColAcc.valueCC)
                        Menu {
                            ForEach(
                                result.sorted(by: {$0.value < $1.value}),
                                id: \.key
                            ) { item in
                                Button {
                                    outputCurr = item.key
                                } label: {
                                    Text (
                                        "\(String(item.key))   \(String(item.value))"
                                    )
                                }
                            }
                        } label: {
                            Text(outputCurr)
                                .amountFontStyleExt(numSize: FontT.titleF.valueF)
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
            .padding(10)
            .overlay{
                ActionButton(
                    buttonDisplay: "arrow.up.arrow.down",
                    infinite: false,
                    alignLeft: false) {
                        let tmp = inputCurr
                        inputCurr = outputCurr
                        outputCurr = tmp
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .frame(maxWidth: sqCardSize + 35, alignment: .leading)
            }
            .toolbar  {
                ToolbarItem(placement: .keyboard) {
                    Spacer()
                    Button{
                        currencyFocus.toggle()
                    } label: {
                        Text("Close")
                    }
                }
            }
        }
        .compositingGroup()
    }
}

#Preview {
    SuccessStateView(result: ["USD":96, "hellssdo":2, "hellssdfsdo":4])
}

